
#ifndef LWIP_HDR_ETHERNETIF_H
#define LWIP_HDR_ETHERNETIF_H

#include "lwipopts.h"
#include "arch/cc.h" 

#include "lwip/def.h"
#include "lwip/mem.h"
#include "lwip/pbuf.h"
#include "lwip/stats.h"
#include "lwip/snmp.h"
#include "lwip/etharp.h"

#include "netif/ethernet.h"

#include <cortos.h>
#include <ajit_access_routines.h>

#include <ajit_mt_irc.h>
#include <core_portme.h>


#define IFNAME0 'e'
#define IFNAME1 'n'
#define ETHERNET_MTU 1500



void 
low_level_init();

/**
 * Helper struct to hold private data used to operate your ethernet interface.
 * Keeping the ethernet address of the MAC in this struct is not necessary
 * as it is already kept in the struct netif.
 * But this is only an example, anyway...
 */
struct ethernetif {
  struct eth_addr *ethaddr;
  /* Add whatever per-interface state that is needed here. */

};

int
ZeroCopyRx_input(struct netif *netif);

int
low_level_input(struct netif *netif);

err_t
low_level_output(struct netif *netif, struct pbuf *p);

err_t 
netif_initialize(struct netif *netif);

void printEthernetFrame(uint8_t *ethernetFrame, int start,int length,int tab);

#endif /* LWIP_HDR_ETHERNETIF_H */


