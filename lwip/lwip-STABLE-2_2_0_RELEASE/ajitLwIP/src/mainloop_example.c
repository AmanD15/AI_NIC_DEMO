
/* Define those to better describe your network interface. */
#define IFNAME0 'e'
#define IFNAME1 'n'
#define ETHERNET_MTU 1500
#define ETHARP_HWADDR_LEN 6

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


err_t 
netif_init(struct netif *netif)
{

  /* set MAC hardware address */
  netif->hwaddr_len = ETHARP_HWADDR_LEN;
  netif->hwaddr[0] = 0x00;
  netif->hwaddr[1] = 0x0a;
  netif->hwaddr[2] = 0x35;
  netif->hwaddr[3] = 0x05;
  netif->hwaddr[4] = 0x76;
  netif->hwaddr[5] = 0xa0;

  /* maximum transfer unit */
  netif->mtu = ETHERNET_MTU; // 1500

  /* device capabilities */
  /* don't set NETIF_FLAG_ETHARP if this device is not an ethernet one */
  netif->flags =  NETIF_FLAG_ETHERNET ;


  netif->state = NULL;
  netif->name[0] = IFNAME0;
  netif->name[1] = IFNAME1;

  netif->output    = NULL; //etharp_output;
  netif->linkoutput = low_level_output;

  cortos_printf ("Configuration Done. NIC has started\n");
  return ERR_OK;

}
void 
main(void)
{
  struct netif netif;
  lwip_init();
  netif_add(&netif, NULL, netif_init, netif_input);

  //netif_create_ip6_linklocal_address(&netif, 1);
  //netif.ip6_autoconfig_enabled = 1;
  //netif_set_status_callback(&netif, netif_status_callback);
  //netif_set_default(&netif);
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

