/**
 * NiralOS Packet Processing
 */

#include <cortos.h>
#include <niralos_defs.h>
#include <niralos_utils.h>
#include <niralos_ip.h>
#include <niralos_pkt_buf.h>
#include <niralos_pkt.h>
#include <niralos_eth.h>

/*
 * Process Packet Lookup
 */
static inline int niralos_pkt_lookup(niralos_pktbuf_t *pkt, niralos_nxthop_t *nh)
{
	niralos_pkt_metadata      *priv_data;
	niralos_tcb               *tcb;
	niralos_stats             *stat;

	priv_data = &pkt->meta;
	tcb = (niralos_tcb *)priv_data->tcb;
	stat = &tcb->pkt_stats;

    NIRALOS_LOG_DEBUG(tcb, MOD_ROUTE, "Routing for Packet %p", pkt);
	return NIRALOS_SUCCESS;
}


/*
 * Process the IPV6 header of incoming packet
 */
static inline int niralos_process_ipv6_hdr(niralos_pktbuf_t *pkt)
{
	niralos_pkt_metadata      *priv_data;

	niralos_tcb               *tcb;
	niralos_stats             *stat;
	niralos_nxthop_t          *nh;

	struct ipv6_hdr           *v6_hdr;

	int                       ret;

	priv_data = &pkt->meta;
	tcb = (niralos_tcb *)priv_data->tcb;
	stat = &tcb->pkt_stats;

	priv_data->l3_hdr = priv_data->start + priv_data->l2_len;


    v6_hdr = (struct ipv6_hdr *)priv_data->l3_hdr;

    stat->ipv6_rx++;

    NIRALOS_SET_IPV6_ADDR(priv_data->dst_ip, v6_hdr->dst_addr);


    /* TODO - Set Fragmentation */


	/* Get L2/L3 Next-hop forwarding Information for IPv4, IPv6, MPLS etc. */
	ret = niralos_pkt_lookup(pkt, nh);
	if (NIRALOS_SUCCESS != ret) {
		stat->l3_lkup_fail++;
		return NIRALOS_ERR;;
	}

    /* TODO - Update the Packet based on Nexthop */

    /* TODO - Enqueue the Packet for Transmission */

    return NIRALOS_SUCCESS;
}

/*
 * Process the IPV4 header of incoming packet
 */
static inline int niralos_process_ipv4_hdr(niralos_pktbuf_t *pkt)
{
	niralos_pkt_metadata      *priv_data;

	niralos_tcb               *tcb;
	niralos_stats             *stat;
	niralos_nxthop_t          *nh;
	int                       ret;

	struct ipv4_hdr           *v4_hdr;

	priv_data = &pkt->meta;
	tcb = (niralos_tcb *)priv_data->tcb;
	stat = &tcb->pkt_stats;

	priv_data->l3_hdr = priv_data->start + priv_data->l2_len;

	NIRALOS_LOG_DEBUG(tcb, MOD_PKTIN, "IPv4 Header Processing for Packet %p", pkt);

    v4_hdr = (struct ipv4_hdr *)priv_data->l3_hdr;

    stat->ipv4_rx++;

    NIRALOS_SET_IPV4_ADDR(priv_data->dst_ip, v4_hdr->dst_addr);

    if (NIRALOS_IS_IPV4_MCAST(v4_hdr->dst_addr)) {
        stat->l3_mcast_rx++;
        return NIRALOS_ERR;
    }


    /* TODO - Set Fragmentation */


	/* Get L2/L3 Next-hop forwarding Information for IPv4, IPv6, MPLS etc. */
	ret = niralos_pkt_lookup(pkt, nh);
	if (NIRALOS_SUCCESS != ret) {
		stat->l3_lkup_fail++;
		return NIRALOS_ERR;;
	}

    /* TODO - Update the Packet based on Nexthop */

    /* TODO - Enqueue the Packet for Transmission */

    return NIRALOS_SUCCESS;
}


static int niralos_l3_process(niralos_pktbuf_t *pkt)
{

	niralos_pkt_metadata      *priv_data;

	niralos_tcb               *tcb;
	niralos_stats             *stat;

	int                       ret = NIRALOS_ERR;

	priv_data = &pkt->meta;
	tcb = (niralos_tcb *)priv_data->tcb;
	stat = &tcb->pkt_stats;

    NIRALOS_LOG_DEBUG(tcb, MOD_PKTIN, "Rxed Packet %p with L3 Proto 0x%x and Pkt-Len %u",
    		pkt, priv_data->l3_proto, priv_data->pkt_len);

    /*
     * Consider only IPv4 packets for processing
     * TODO - Skip MPLS, Tunnel, ARP and IPv6 packets
     */
    switch (priv_data->l3_proto) {
        case ETHER_TYPE_IPV4:
        {
            ret = niralos_process_ipv4_hdr(pkt);
            break;
        }
        case ETHER_TYPE_IPV6:
        {
            ret = niralos_process_ipv6_hdr(pkt);
            break;
        }
        case ETHER_TYPE_MPLS_UNI:
        case ETHER_TYPE_MPLS_MULTI:
        {
            stat->mpls_rx++;
            break;
        }
        case ETHER_TYPE_ARP:
        case ETHER_TYPE_RARP:
        {
            stat->arp_rx++;
            break;
        }
        case ETHER_TYPE_PPPOE_DISCOVERY:
        case ETHER_TYPE_PPPOE_SESSION:
        {
            stat->ppp_rx++;
            break;
        }

        default:
        {
            stat->misc_l3_rx++;
        }
    }

	return ret;
}

static int niralos_l2_process(niralos_pktbuf_t *pkt)
{
	uint8_t                   *pdata;
	niralos_pkt_metadata      *priv_data;
	struct ether_hdr          *eth_hdr;
	uint16_t                  eth_type;
	niralos_tcb               *tcb;
	niralos_stats             *stat;

	priv_data = &pkt->meta;
	pdata = pkt->data;
	tcb = (niralos_tcb *)priv_data->tcb;
	stat = &tcb->pkt_stats;

	eth_hdr = (struct ether_hdr *)pdata;

	eth_type = NIRALOS_NTOHS(eth_hdr->ether_type);


    priv_data->pkt_len = pkt->tot_len;
    priv_data->start = niralos_pktbuf_start(pkt);

    stat->pkt_rx++;
    stat->byte_rx += priv_data->pkt_len;

    NIRALOS_LOG_DEBUG(tcb, MOD_PKTIN, "Rxed Packet with Eth-Type 0x%x and Pkt-Len %u",
    		eth_type, priv_data->pkt_len);

    /*
     * Consider only VLAN and Q-in-Q (2 VLAN) packets
     * TODO - Support of multi-VLAN, VxLAN, above 2 VLAN
     */
    switch (eth_type) {
        case ETHER_TYPE_VLAN:
        {
        	struct vlan_hdr* vh = (struct vlan_hdr*)(eth_hdr+1);
        	priv_data->vlan_tci = NIRALOS_NTOHS(vh->vlan_tci & 0xfff);
        	priv_data->l2_len = ETHER_HDR_LEN + sizeof(struct vlan_hdr);
            eth_type = NIRALOS_NTOHS(vh->eth_proto);

            stat->vlan_rx++;
            break;
        }
        case ETHER_TYPE_QINQ:
        case ETHER_TYPE_QINQ1:
        case ETHER_TYPE_QINQ2:
        case ETHER_TYPE_QINQ3:
        {
        	/* Parse Outer VLAN */
            struct vlan_hdr* vh = (struct vlan_hdr*)(eth_hdr+1);
            priv_data->vlan_tci_outer = NIRALOS_NTOHS(vh->vlan_tci & 0xfff);
            /* Parse Inner VLAN */
            vh = (struct vlan_hdr*)(pdata + sizeof(struct vlan_hdr));
            priv_data->vlan_tci = NIRALOS_NTOHS(vh->vlan_tci & 0xfff);
            priv_data->l2_len = ETHER_HDR_LEN +
                    sizeof(struct vlan_hdr) + sizeof(struct vlan_hdr);
            eth_type = NIRALOS_NTOHS(vh->eth_proto);

            stat->qinq_rx++;
            break;
        }
        default:
        {
            priv_data->l2_len = ETHER_HDR_LEN;
        }
    }

    priv_data->l3_proto = eth_type;

    /* Skip Broadcast Packet */
    if (niralos_is_broadcast_ether_addr(&eth_hdr->dst_addr)) {
    	NIRALOS_LOG_DEBUG(tcb, MOD_PKTIN, "Skip Processing Broadcast Packet %p for Routing",
    			          pkt);
        stat->l2_bcast++;
        return NIRALOS_ERR;
    }

   /* Skip Multicast Packet, TODO - Check for IPTV scenarios */
   if (niralos_is_multicast_ether_addr(&eth_hdr->dst_addr)) {
   	   NIRALOS_LOG_DEBUG(tcb, MOD_PKTIN, "Skip Processing Multicast Packet %p for Routing",
   			             pkt);
       stat->l2_mcast++;
       return NIRALOS_ERR;
   }
    return NIRALOS_SUCCESS;
}


int niralos_pkt_scheduler(niralos_tcb *tcb)
{
    niralos_pktq         *pktq = &tcb->pkt_rxq;
    niralos_pktq         *tx_pktq = &tcb->pkt_txq[0];
    niralos_stats        *stats = &tcb->pkt_stats;

    uint16_t             num_pkt;
    int                  ret = NIRALOS_SUCCESS;
    int                  i;


    /* Receive packet from RX Queue port */
    pktq->num_pkt = IN_PKT_NUM;
    num_pkt = niralos_pkt_dequeue(pktq);
    //cortos_printf(tcb, MOD_ROUTE, "Rx Packet %u for routing from Rxq %p", num_pkt, pktq->qptr);
    NIRALOS_LOG_DEBUG( "Rx Packet %u for routing from Rxq %p", num_pkt, pktq->qptr);

    if (!num_pkt) {
        return NIRALOS_SUCCESS;
    }

    /* Do Packet Processing for all the packets received from the queue */
    for (i = 0; i < num_pkt; i++) {


    	niralos_pktbuf_t     *pkt = (niralos_pktbuf_t *)pktq->buf_arr[i];
    	uint8_t              *pdata;
    	niralos_pkt_metadata *priv_data;
	//cortos_printf("Processing Rx Packet with index %u - %p for routing",
          //                        i, pkt);
        NIRALOS_LOG_DEBUG(tcb, MOD_ROUTE, "Processing Rx Packet with index %u - %p for routing",
        		          i, pkt);

        if (pkt == NULL) {
        	NIRALOS_LOG_ERR(tcb, MOD_ROUTE, "Rx Packet for index %d is NULL", i);

        	pktq->tot_pkt++;
        	pktq->num_pkt--;
        	stats->pkt_rx++;
        	stats->rx_fail++;
            continue;
        }


        stats->pkt_rx++;
        stats->byte_rx +=  pkt->tot_len;

    	priv_data = &pkt->meta;
    	priv_data->tcb =  (uint8_t *)tcb;
    	pdata = pkt->data;

    	/* Do Layer-2 Processing - Ethernet, VLAN, VxLAN, Q-in-Q etc. */
    	ret = niralos_l2_process(pkt);

    	if (NIRALOS_SUCCESS != ret) {
    		NIRALOS_LOG_DEBUG(tcb, MOD_ROUTE, "L2 Processing for Packet %p Failed", pkt);
    		niralos_pktbuf_free(pkt);
    		stats->l2_fail++;
    		continue;
    	}

    	/* Do Layer-3 Processing - IPv4, IPv6, MPLS etc. */
    	ret = niralos_l3_process(pkt);
    	if (NIRALOS_SUCCESS != ret) {
    		NIRALOS_LOG_DEBUG(tcb, MOD_ROUTE, "L3 Processing for Packet %p Failed", pkt);
    		niralos_pktbuf_free(pkt);
    		stats->l3_fail++;
    		continue;
    	}

    	/* Update Packet and Send to Outgoing Interface */
    	tx_pktq->buf_arr[0] = (uint8_t *)pkt;
    	tx_pktq->num_pkt = 1;
    	ret = niralos_pkt_enqueue(tx_pktq);
    	if (0 == ret) {
    		NIRALOS_LOG_ERR(tcb, MOD_ROUTE, "Packet %p could not be sent to OutQ", pkt);
    		niralos_pktbuf_free(pkt);
    		stats->tx_fail++;
    		continue;
    	}
	//cortos_printf(tcb, MOD_ROUTE, "Route processing completed for Packet %p and Transmit to Outq %p",
       //                           pkt, tx_pktq->qptr);
    	NIRALOS_LOG_DEBUG(tcb, MOD_ROUTE, "Route processing completed for Packet %p and Transmit to Outq %p",
    			          pkt, tx_pktq->qptr);
    }
}
