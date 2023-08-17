/**
 * NiralOS Pkt Buffer Data Structure
 */

#pragma once
#include <niralos_ip.h>
#include <niralos_eth.h>


#define NIRALOS_PKTBUF_SIZE  1600
#define NIRALOS_PKTBUF_DEFAULT_HEADROOM  64

typedef struct niralos_pkt_metadata_ {
	uint16_t          l3_proto;      /* IPv4 or IPv6 for Inner tunnel */
    uint16_t          vlan_tci_outer;
    uint16_t          vlan_tci;
    uint16_t          test_idx;
    uint8_t           is_frag;       /* Need Reassembly */
    uint8_t           src_port_id;   /* Packet Direction */
    uint8_t           *tcb;          /* Current Thread that is owner of Packet */

    uint16_t          pkt_len;       /* Packet Len */

    uint8_t           *start;        /* Start of the Packet */
    uint8_t           *l3_hdr;       /* IP Header */

    uint16_t          l2_len;        /* Packet Len */
    uint16_t          l3_hdr_len;    /* Length of Inner IP Header */
    uint16_t          l4_hdr_len;    /* Length of Inner TCP/UDP Header */

    niralos_ip        dst_ip;

} niralos_pkt_metadata;

typedef struct niralos_pkbuf_s {
    uint16_t             tot_len;
    uint16_t  		     buf_len;

    uint8_t   		     *next_buf;

    uint8_t   		     *head;
    uint8_t   		     *tail;
    uint8_t   		     *data;
    uint8_t  		     *end;

    niralos_pkt_metadata meta;

    uint8_t              buf[NIRALOS_PKTBUF_SIZE];

} niralos_pktbuf_t;

typedef struct niralos_nxthop_s {
	uint8_t              out_qid;
	struct ether_hdr     nexthop_eth_hdr;
	struct vlan_hdr      nexthop_vlan_hdr;

} niralos_nxthop_t;

#define niralos_pktbuf_start(pkt) pkt->data
#define niralos_pktbuf_len(pkt)   pkt->tot_len

static inline int niralos_pktbuf_init(niralos_pktbuf_t *pkt)
{
    if (NULL == pkt)
        return NIRALOS_ERR;

    pkt->tot_len = pkt->buf_len = 0;
    pkt->next_buf = NULL;
    pkt->head = &pkt->buf[0];
    pkt->end = &pkt->buf[NIRALOS_PKTBUF_SIZE-1];
    pkt->data = pkt->tail = pkt->head + NIRALOS_PKTBUF_DEFAULT_HEADROOM;

    return NIRALOS_SUCCESS;
}

static inline int niralos_pktbuf_tailroom(niralos_pktbuf_t *pkt)
{
    return pkt->end - pkt->tail;   
}

static inline int niralos_pktbuf_headroom(niralos_pktbuf_t *pkt)
{
    return pkt->data - pkt->head;   
}

static inline int niralos_pktbuf_append_data(niralos_pktbuf_t *pkt, unsigned char* data, unsigned int len)
{
    if (niralos_pktbuf_tailroom(pkt) > len) 
    {
        memcpy(pkt->tail, data, len);
        pkt->tail += len;
        pkt->buf_len += len;
        pkt->tot_len += len;
        return NIRALOS_SUCCESS;
    }
    return NIRALOS_ERR;
}

static inline int niralos_pktbuf_prepend_data(niralos_pktbuf_t *pkt, unsigned char* data, unsigned int len)
{
    if (niralos_pktbuf_headroom(pkt) > len) 
    {
        memcpy(pkt->data, data, len);
        pkt->data -= len;
        pkt->buf_len += len;
        pkt->tot_len += len;
        return NIRALOS_SUCCESS;
    }
    return NIRALOS_ERR;
}

static inline niralos_pktbuf_t* niralos_pktbuf_alloc(void)
{
	niralos_pktbuf_t *buf = (niralos_pktbuf_t *) cortos_bget(sizeof(niralos_pktbuf_t));

	if (buf)
	{
		niralos_pktbuf_init(buf);
		return buf;
	}

    return NULL;
}

static inline void niralos_pktbuf_free(niralos_pktbuf_t* buf)
{

	if (buf)
	{
		return cortos_brel(buf);
		return;
	}

    return;
}

