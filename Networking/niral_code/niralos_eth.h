/**
 * NiralOS Ethernet Frame Utilities
 */

#pragma once

#include "niralos_defs.h"
#include "niralos_utils.h"


/* Ethernet frame types */
#define ETHER_TYPE_IPV4    			0x0800
#define ETHER_TYPE_IPV6    			0x86DD
#define ETHER_TYPE_ARP    			0x0806
#define ETHER_TYPE_RARP    			0x8035
#define ETHER_TYPE_VLAN    			0x8100
#define ETHER_TYPE_QINQ    			0x88A8
#define ETHER_TYPE_QINQ1           	0x9100
#define ETHER_TYPE_QINQ2           	0x9200
#define ETHER_TYPE_QINQ3           	0x9300
#define ETHER_TYPE_PPPOE_DISCOVERY 	0x8863
#define ETHER_TYPE_PPPOE_SESSION   	0x8864
#define ETHER_TYPE_ETAG 			0x893F
#define ETHER_TYPE_1588 			0x88F7

#define ETHER_TYPE_SLOW 			0x8809
#define ETHER_TYPE_TEB  			0x6558
#define ETHER_TYPE_LLDP 			0x88CC
#define ETHER_TYPE_MPLS_UNI 		0x8847
#define ETHER_TYPE_MPLS_MULTI 		0x8848
#define ETHER_TYPE_ECPRI 			0xAEFE

#define ETHER_ADDR_LEN  			6
#define ETHER_TYPE_LEN  			2
#define ETHER_CRC_LEN   			4
#define ETHER_HDR_LEN   			(ETHER_ADDR_LEN * 2 + ETHER_TYPE_LEN)
#define ETHER_MIN_LEN   			64
#define ETHER_MAX_LEN   			1518
#define ETHER_MTU       			\
        					(ETHER_MAX_LEN - ETHER_HDR_LEN - ETHER_CRC_LEN)
#define VLAN_HLEN       			4
#define ETHER_MAX_VLAN_FRAME_LEN 	\
        					(ETHER_MAX_LEN + VLAN_HLEN)

#define ETHER_MAX_JUMBO_FRAME_LEN   0x3F00
#define ETHER_MAX_VLAN_ID  			4095

#define ETHER_GROUP_ADDR   			0x01


#define ETHER_ADDR_PRT_FMT     		"%02X:%02X:%02X:%02X:%02X:%02X"

#define ETHER_ADDR_BYTES(mac_addrs) ((mac_addrs)->addr_bytes[0]), \
                      ((mac_addrs)->addr_bytes[1]), \
                      ((mac_addrs)->addr_bytes[2]), \
                      ((mac_addrs)->addr_bytes[3]), \
                      ((mac_addrs)->addr_bytes[4]), \
                      ((mac_addrs)->addr_bytes[5])



struct ether_addr {
    unsigned char addr_bytes[ETHER_ADDR_LEN];
} __attribute__((packed));

struct ether_hdr {
    struct ether_addr dst_addr;
    struct ether_addr src_addr;
    unsigned short ether_type;
} __attribute__((packed));

struct vlan_hdr {
    unsigned short vlan_tci;
    unsigned short eth_proto;
} __attribute__((packed));

struct vxlan_hdr {
	uint32_t vx_flags;
	uint32_t vx_vni;
} __attribute__((__packed__));

 static inline int niralos_is_unicast_ether_addr(const struct ether_addr *ea)
 {
     return (ea->addr_bytes[0] & ETHER_GROUP_ADDR) == 0;
 }

 static inline int niralos_is_multicast_ether_addr(const struct ether_addr *ea)
 {
     return ea->addr_bytes[0] & ETHER_GROUP_ADDR;
 }

 static inline int niralos_is_broadcast_ether_addr(const struct ether_addr *ea)
 {
     const unsigned short *w = (const unsigned short *)ea;

     return (w[0] & w[1] & w[2]) == 0xFFFF;
 }

