void
eth_mac_irq()
{
  /* Service MAC IRQ here */
  /* Allocate pbuf from pool (avoid using heap in interrupts) */
  struct pbuf* p = pbuf_alloc(PBUF_RAW, eth_data_count, PBUF_POOL);
  if(p != NULL) {
    /* Copy ethernet frame into pbuf */
    pbuf_take(p, eth_data, eth_data_count);
    /* Put in a queue which is processed in main loop */
    if(!queue_try_put(&queue, p)) {
      /* queue is full -> packet loss */
      pbuf_free(p);
    }
  }
}
static err_t 
netif_output(struct netif *netif, struct pbuf *p)
{
  LINK_STATS_INC(link.xmit);
  /* Update SNMP stats (only if you use SNMP) */
  MIB2_STATS_NETIF_ADD(netif, ifoutoctets, p->tot_len);
  int unicast = ((p->payload[0] & 0x01) == 0);
  if (unicast) {
    MIB2_STATS_NETIF_INC(netif, ifoutucastpkts);
  } else {
    MIB2_STATS_NETIF_INC(netif, ifoutnucastpkts);
  }
  lock_interrupts();
  pbuf_copy_partial(p, mac_send_buffer, p->tot_len, 0);
  /* Start MAC transmit here */
  unlock_interrupts();
  return ERR_OK;
}
static void 
netif_status_callback(struct netif *netif)
{
  printf("netif status changed %s\n", ip4addr_ntoa(netif_ip4_addr(netif)));
}
static err_t 
netif_init(struct netif *netif)
{
  netif->linkoutput = netif_output;
  netif->output     = etharp_output;
  netif->output_ip6 = ethip6_output;
  netif->mtu        = ETHERNET_MTU;
  netif->flags      = NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP | NETIF_FLAG_ETHERNET | NETIF_FLAG_IGMP | NETIF_FLAG_MLD6;
  MIB2_INIT_NETIF(netif, snmp_ifType_ethernet_csmacd, 100000000);
  SMEMCPY(netif->hwaddr, your_mac_address_goes_here, ETH_HWADDR_LEN);
  netif->hwaddr_len = ETH_HWADDR_LEN;
  return ERR_OK;
}
void 
main(void)
{
  struct netif netif;
  lwip_init();
  netif_add(&netif, IP4_ADDR_ANY, IP4_ADDR_ANY, IP4_ADDR_ANY, NULL, netif_init, netif_input);
  netif.name[0] = 'e';
  netif.name[1] = '0';
  netif_create_ip6_linklocal_address(&netif, 1);
  netif.ip6_autoconfig_enabled = 1;
  netif_set_status_callback(&netif, netif_status_callback);
  netif_set_default(&netif);
  netif_set_up(&netif);
  
  /* Start DHCP and HTTPD */
  dhcp_start(&netif );
  httpd_init();
  while(1) {
    /* Check link state, e.g. via MDIO communication with PHY */
    if(link_state_changed()) {
      if(link_is_up()) {
        netif_set_link_up(&netif);
      } else {
        netif_set_link_down(&netif);
      }
    }
    /* Check for received frames, feed them to lwIP */
    lock_interrupts();
    struct pbuf* p = queue_try_get(&queue);
    unlock_interrupts();
    if(p != NULL) {
      LINK_STATS_INC(link.recv);
 
      /* Update SNMP stats (only if you use SNMP) */
      MIB2_STATS_NETIF_ADD(netif, ifinoctets, p->tot_len);
      int unicast = ((p->payload[0] & 0x01) == 0);
      if (unicast) {
        MIB2_STATS_NETIF_INC(netif, ifinucastpkts);
      } else {
        MIB2_STATS_NETIF_INC(netif, ifinnucastpkts);
      }
      if(netif.input(p, &netif) != ERR_OK) {
        pbuf_free(p);
      }
    }
     
    /* Cyclic lwIP timers check */
    sys_check_timeouts();
     
    /* your application goes here */
  }
}



/**
 * This is an example of a "ping" sender (with raw API and socket API).
 * It can be used as a start point to maintain opened a network connection, or
 * like a network "watchdog" for your device.
 *
 */

#include "lwip/opt.h"

#if LWIP_RAW /* don't build if not configured for use in lwipopts.h */

#include "ping.h"

#include "lwip/mem.h"
#include "lwip/raw.h"
#include "lwip/icmp.h"
#include "lwip/netif.h"
#include "lwip/sys.h"
#include "lwip/timeouts.h"
#include "lwip/inet_chksum.h"
#include "lwip/prot/ip4.h"

#if PING_USE_SOCKETS
#include "lwip/sockets.h"
#include "lwip/inet.h"
#include <string.h>
#endif /* PING_USE_SOCKETS */


/**
 * PING_DEBUG: Enable debugging for PING.
 */
#ifndef PING_DEBUG
#define PING_DEBUG     LWIP_DBG_ON
#endif

/** ping receive timeout - in milliseconds */
#ifndef PING_RCV_TIMEO
#define PING_RCV_TIMEO 1000
#endif

/** ping delay - in milliseconds */
#ifndef PING_DELAY
#define PING_DELAY     1000
#endif

/** ping identifier - must fit on a u16_t */
#ifndef PING_ID
#define PING_ID        0xAFAF
#endif

/** ping additional data size to include in the packet */
#ifndef PING_DATA_SIZE
#define PING_DATA_SIZE 32
#endif

/** ping result action - no default action */
#ifndef PING_RESULT
#define PING_RESULT(ping_ok)
#endif

/* ping variables */
static const ip_addr_t* ping_target;
static u16_t ping_seq_num;
#ifdef LWIP_DEBUG
static u32_t ping_time;
#endif /* LWIP_DEBUG */
#if !PING_USE_SOCKETS
static struct raw_pcb *ping_pcb;
#endif /* PING_USE_SOCKETS */

/** Prepare a echo ICMP request */
static void
ping_prepare_echo( struct icmp_echo_hdr *iecho, u16_t len)
{
  size_t i;
  size_t data_len = len - sizeof(struct icmp_echo_hdr);

  ICMPH_TYPE_SET(iecho, ICMP_ECHO);
  ICMPH_CODE_SET(iecho, 0);
  iecho->chksum = 0;
  iecho->id     = PING_ID;
  iecho->seqno  = lwip_htons(++ping_seq_num);

  /* fill the additional data buffer with some data */
  for(i = 0; i < data_len; i++) {
    ((char*)iecho)[sizeof(struct icmp_echo_hdr) + i] = (char)i;
  }

  iecho->chksum = inet_chksum(iecho, len);
}

static void
ping_thread(void *arg)
{
  int s;
  int ret;

#if LWIP_SO_SNDRCVTIMEO_NONSTANDARD
  int timeout = PING_RCV_TIMEO;
#else
  struct timeval timeout;
  timeout.tv_sec = PING_RCV_TIMEO/1000;
  timeout.tv_usec = (PING_RCV_TIMEO%1000)*1000;
#endif
  LWIP_UNUSED_ARG(arg);


  s = lwip_socket(AF_INET,  SOCK_RAW, IP_PROTO_ICMP);

  if (s < 0) {
    return;
  }

  ret = lwip_setsockopt(s, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout));
  LWIP_ASSERT("setting receive timeout failed", ret == 0);
  LWIP_UNUSED_ARG(ret);

  while (1) {
    if (ping_send(s, ping_target) == ERR_OK) {
      LWIP_DEBUGF( PING_DEBUG, ("ping: send "));
      ip_addr_debug_print(PING_DEBUG, ping_target);
      LWIP_DEBUGF( PING_DEBUG, ("\n"));

#ifdef LWIP_DEBUG
      ping_time = sys_now();
#endif /* LWIP_DEBUG */
      ping_recv(s);
    } else {
      LWIP_DEBUGF( PING_DEBUG, ("ping: send "));
      ip_addr_debug_print(PING_DEBUG, ping_target);
      LWIP_DEBUGF( PING_DEBUG, (" - error\n"));
    }
    sys_msleep(PING_DELAY);
  }
}


/* Ping using the raw ip */
static u8_t
ping_recv(void *arg, struct raw_pcb *pcb, struct pbuf *p, const ip_addr_t *addr)
{
  struct icmp_echo_hdr *iecho;
  LWIP_UNUSED_ARG(arg);
  LWIP_UNUSED_ARG(pcb);
  LWIP_UNUSED_ARG(addr);
  LWIP_ASSERT("p != NULL", p != NULL);

  if ((p->tot_len >= (PBUF_IP_HLEN + sizeof(struct icmp_echo_hdr))) &&
      pbuf_remove_header(p, PBUF_IP_HLEN) == 0) {
    iecho = (struct icmp_echo_hdr *)p->payload;

    if ((iecho->id == PING_ID) && (iecho->seqno == lwip_htons(ping_seq_num))) {
      LWIP_DEBUGF( PING_DEBUG, ("ping: recv "));
      ip_addr_debug_print(PING_DEBUG, addr);
      LWIP_DEBUGF( PING_DEBUG, (" %"U32_F" ms\n", (sys_now()-ping_time)));

      /* do some ping result processing */
      PING_RESULT(1);
      pbuf_free(p);
      return 1; /* eat the packet */
    }
    /* not eaten, restore original packet */
    pbuf_add_header(p, PBUF_IP_HLEN);
  }

  return 0; /* don't eat the packet */
}

static void
ping_send(struct raw_pcb *raw, const ip_addr_t *addr)
{
  struct pbuf *p;
  struct icmp_echo_hdr *iecho;
  size_t ping_size = sizeof(struct icmp_echo_hdr) + PING_DATA_SIZE;

  LWIP_DEBUGF( PING_DEBUG, ("ping: send "));
  ip_addr_debug_print(PING_DEBUG, addr);
  LWIP_DEBUGF( PING_DEBUG, ("\n"));
  LWIP_ASSERT("ping_size <= 0xffff", ping_size <= 0xffff);

  p = pbuf_alloc(PBUF_IP, (u16_t)ping_size, PBUF_RAM);
  if (!p) {
    return;
  }
  if ((p->len == p->tot_len) && (p->next == NULL)) {
    iecho = (struct icmp_echo_hdr *)p->payload;

    ping_prepare_echo(iecho, (u16_t)ping_size);

    raw_sendto(raw, p, addr);
#ifdef LWIP_DEBUG
    ping_time = sys_now();
#endif /* LWIP_DEBUG */
  }
  pbuf_free(p);
}

static void
ping_timeout(void *arg)
{
  struct raw_pcb *pcb = (struct raw_pcb*)arg;

  LWIP_ASSERT("ping_timeout: no pcb given!", pcb != NULL);

  ping_send(pcb, ping_target);

  sys_timeout(PING_DELAY, ping_timeout, pcb);
}

static void
ping_raw_init(void)
{
  ping_pcb = raw_new(IP_PROTO_ICMP);
  LWIP_ASSERT("ping_pcb != NULL", ping_pcb != NULL);
  raw_recv(ping_pcb, ping_recv, NULL);
  raw_bind(ping_pcb, IP_ADDR_ANY);
  sys_timeout(PING_DELAY, ping_timeout, ping_pcb);
}

void
ping_send_now(void)
{
  LWIP_ASSERT("ping_pcb != NULL", ping_pcb != NULL);
  ping_send(ping_pcb, ping_target);
}

#endif /* PING_USE_SOCKETS */

void
ping_init(const ip_addr_t* ping_addr)
{
  ping_target = ping_addr;
  ping_raw_init();

}



/***********************************************/


/**
 * Determine if in incoming IP packet is covered by a RAW PCB
 * and if so, pass it to a user-provided receive callback function.
 *
 * Given an incoming IP datagram (as a chain of pbufs) this function
 * finds a corresponding RAW PCB and calls the corresponding receive
 * callback function.
 *
 * @param p pbuf to be demultiplexed to a RAW PCB.
 * @param inp network interface on which the datagram was received.
 * @return - 1 if the packet has been eaten by a RAW PCB receive
 *           callback function. The caller MAY NOT not reference the
 *           packet any longer, and MAY NOT call pbuf_free().
 * @return - 0 if packet is not eaten (pbuf is still referenced by the
 *           caller).
 *
 */
raw_input_state_t
raw_input(struct pbuf *p, struct netif *inp)
{
  struct raw_pcb *pcb, *prev;
  s16_t proto;
  raw_input_state_t ret = RAW_INPUT_NONE;
  u8_t broadcast = ip_addr_isbroadcast(ip_current_dest_addr(), ip_current_netif());

  LWIP_UNUSED_ARG(inp);

#if LWIP_IPV6
#if LWIP_IPV4
  if (IP_HDR_GET_VERSION(p->payload) == 6)
#endif /* LWIP_IPV4 */
  {
    struct ip6_hdr *ip6hdr = (struct ip6_hdr *)p->payload;
    proto = IP6H_NEXTH(ip6hdr);
  }
#if LWIP_IPV4
  else
#endif /* LWIP_IPV4 */
#endif /* LWIP_IPV6 */
#if LWIP_IPV4
  {
    proto = IPH_PROTO((struct ip_hdr *)p->payload);
  }
#endif /* LWIP_IPV4 */

  prev = NULL;
  pcb = raw_pcbs;
  /* loop through all raw pcbs until the packet is eaten by one */
  /* this allows multiple pcbs to match against the packet by design */
  while (pcb != NULL) {
    if ((pcb->protocol == proto) && raw_input_local_match(pcb, broadcast) &&
        (((pcb->flags & RAW_FLAGS_CONNECTED) == 0) ||
         ip_addr_eq(&pcb->remote_ip, ip_current_src_addr()))) {
      /* receive callback function available? */
      if (pcb->recv != NULL) {
        u8_t eaten;
#ifndef LWIP_NOASSERT
        void *old_payload = p->payload;
#endif
        ret = RAW_INPUT_DELIVERED;
        /* the receive callback function did not eat the packet? */
        eaten = pcb->recv(pcb->recv_arg, pcb, p, ip_current_src_addr());
        if (eaten != 0) {
          /* receive function ate the packet */
          p = NULL;
          if (prev != NULL) {
            /* move the pcb to the front of raw_pcbs so that is
               found faster next time */
            prev->next = pcb->next;
            pcb->next = raw_pcbs;
            raw_pcbs = pcb;
          }
          return RAW_INPUT_EATEN;
        } else {
          /* sanity-check that the receive callback did not alter the pbuf */
          LWIP_ASSERT("raw pcb recv callback altered pbuf payload pointer without eating packet",
                      p->payload == old_payload);
        }
      }
      /* no receive callback function was set for this raw PCB */
    }
    /* drop the packet */
    prev = pcb;
    pcb = pcb->next;
  }
  return ret;
}



/** the RAW protocol control block */
struct raw_pcb {
  /* Common members of all PCB types */
  IP_PCB;

  struct raw_pcb *next;
  u8_t protocol;
  u8_t flags;

  /** receive callback function */
  raw_recv_fn recv;
  /* user-supplied argument for the recv callback */
  void *recv_arg;

};


 /* points to packet payload, which starts with an Ethernet header */
  ethhdr = (struct eth_hdr *)p->payload;
  LWIP_DEBUGF(ETHARP_DEBUG | LWIP_DBG_TRACE,
              ("ethernet_input: dest:%"X8_F":%"X8_F":%"X8_F":%"X8_F":%"X8_F":%"X8_F", src:%"X8_F":%"X8_F":%"X8_F":%"X8_F":%"X8_F":%"X8_F", type:%"X16_F"\n",
               (unsigned char)ethhdr->dest.addr[0], (unsigned char)ethhdr->dest.addr[1], (unsigned char)ethhdr->dest.addr[2],
               (unsigned char)ethhdr->dest.addr[3], (unsigned char)ethhdr->dest.addr[4], (unsigned char)ethhdr->dest.addr[5],
               (unsigned char)ethhdr->src.addr[0],  (unsigned char)ethhdr->src.addr[1],  (unsigned char)ethhdr->src.addr[2],
               (unsigned char)ethhdr->src.addr[3],  (unsigned char)ethhdr->src.addr[4],  (unsigned char)ethhdr->src.addr[5],
               lwip_htons(ethhdr->type)));

