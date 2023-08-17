/**
 * NiralOS Packet Data Structure and Utilities
 */

#pragma once

#include "niralos_utils.h"
#include "niralos_ip.h"


typedef struct niralos_stats_s {

	uint32_t      pkt_rx;
	uint32_t      byte_rx;
	uint32_t      rx_fail;

	uint32_t      vlan_rx;
	uint32_t      qinq_rx;

	uint32_t      l2_bcast;
	uint32_t      l2_mcast;
	uint32_t      l2_fail;

	uint32_t      ipv4_rx;
	uint32_t      ipv6_rx;
	uint32_t      mpls_rx;
	uint32_t      arp_rx;
	uint32_t      ppp_rx;
	uint32_t      misc_l3_rx;
	uint32_t      l3_bcast_rx;
	uint32_t      l3_mcast_rx;
	uint32_t      l3_fail;
	uint32_t      l3_lkup_fail;

	uint32_t      pkt_tx;
	uint32_t      byte_tx;
	uint32_t      pkt_ipv4_tx;
	uint32_t      pkt_ipv6_tx;
	uint32_t      tx_fail;

} niralos_stats;

typedef struct niralos_tcb_s {
	niralos_pktq        pkt_rxq;
	niralos_pktq 	    pkt_txq[NIRALOS_MAX_IF];
	niralos_stats       pkt_stats;

	uint8_t             core_id;
	uint8_t             thread_id;

} niralos_tcb;

int niralos_pkt_scheduler(niralos_tcb *tcb);
