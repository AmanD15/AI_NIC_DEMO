/**
 * NiralOS IP Packet Utilities
 */

#pragma once

#include "niralos_utils.h"

#define NIRALOS_IPV4(a, b, c, d) ((uint32_t)(((a) & 0xff) << 24) | \
                        (((b) & 0xff) << 16) | \
                        (((c) & 0xff) << 8)  | \
                        ((d) & 0xff))

 #define NIRALOS_IPV4_MAX_PKT_LEN        65535

 #define NIRALOS_IPV4_HDR_IHL_MASK   (0x0f)

 #define NIRALOS_IPV4_IHL_MULTIPLIER (4)

 /* Type of Service fields */
 #define NIRALOS_IPV4_HDR_DSCP_MASK  (0xfc)
 #define NIRALOS_IPV4_HDR_ECN_MASK   (0x03)
 #define NIRALOS_IPV4_HDR_ECN_CE RTE_IPV4_HDR_ECN_MASK

 /* Fragment Offset * Flags. */
 #define NIRALOS_IPV4_HDR_DF_SHIFT   14
 #define NIRALOS_IPV4_HDR_MF_SHIFT   13
 #define NIRALOS_IPV4_HDR_FO_SHIFT   3

 #define NIRALOS_IPV4_HDR_DF_FLAG    (1 << NIRALOS_IPV4_HDR_DF_SHIFT)
 #define NIRALOS_IPV4_HDR_MF_FLAG    (1 << NIRALOS_IPV4_HDR_MF_SHIFT)

 #define NIRALOS_IPV4_HDR_OFFSET_MASK    ((1 << NIRALOS_IPV4_HDR_MF_SHIFT) - 1)

 #define NIRALOS_IPV4_HDR_OFFSET_UNITS   8

 /*
  * IPv4 address types
  */
 #define NIRALOS_IPV4_ANY              ((uint32_t)0x00000000)
 #define NIRALOS_IPV4_LOOPBACK         ((uint32_t)0x7f000001)
 #define NIRALOS_IPV4_BROADCAST        ((uint32_t)0xe0000000)
 #define NIRALOS_IPV4_ALLHOSTS_GROUP   ((uint32_t)0xe0000001)
 #define NIRALOS_IPV4_ALLRTRS_GROUP    ((uint32_t)0xe0000002)
 #define NIRALOS_IPV4_MAX_LOCAL_GROUP  ((uint32_t)0xe00000ff)
 /*
  * IPv4 Multicast-related macros
  */
 #define NIRALOS_IPV4_MIN_MCAST \
     NIRALOS_IPV4(224, 0, 0, 0)
 #define NIRALOS_IPV4_MAX_MCAST \
     NIRALOS_IPV4(239, 255, 255, 255)
 #define NIRALOS_IS_IPV4_MCAST(x) \
     ((x) >= NIRALOS_IPV4_MIN_MCAST && (x) <= NIRALOS_IPV4_MAX_MCAST)

 /* IPv4 default fields values */
 #define NIRALOS_IPV4_MIN_IHL    (0x5)
 #define NIRALOS_IPV4_VHL_DEF    ((IPVERSION << 4) | NIRALOS_IPV4_MIN_IHL)


 /* IPv6 vtc_flow: IPv / TC / flow_label */
 #define NIRALOS_IPV6_HDR_FL_SHIFT 0
 #define NIRALOS_IPV6_HDR_TC_SHIFT 20
 #define NIRALOS_IPV6_HDR_FL_MASK    ((1u << NIRALOS_IPV6_HDR_TC_SHIFT) - 1)
 #define NIRALOS_IPV6_HDR_TC_MASK    (0xff << NIRALOS_IPV6_HDR_TC_SHIFT)
 #define NIRALOS_IPV6_HDR_DSCP_MASK  (0xfc << NIRALOS_IPV6_HDR_TC_SHIFT)
 #define NIRALOS_IPV6_HDR_ECN_MASK   (0x03 << NIRALOS_IPV6_HDR_TC_SHIFT)
 #define NIRALOS_IPV6_HDR_ECN_CE RTE_IPV6_HDR_ECN_MASK

 #define NIRALOS_IPV6_MIN_MTU 1280
#define NIRALOS_IPV6_EHDR_MF_SHIFT  0
 #define NIRALOS_IPV6_EHDR_MF_MASK   1
 #define NIRALOS_IPV6_EHDR_FO_SHIFT  3
 #define NIRALOS_IPV6_EHDR_FO_MASK   (~((1 << NIRALOS_IPV6_EHDR_FO_SHIFT) - 1))
 #define NIRALOS_IPV6_EHDR_FO_ALIGN  (1 << NIRALOS_IPV6_EHDR_FO_SHIFT)

 #define NIRALOS_IPV6_FRAG_USED_MASK (NIRALOS_IPV6_EHDR_MF_MASK | NIRALOS_IPV6_EHDR_FO_MASK)

 #define NIRALOS_IPV6_GET_MF(x)  ((x) & NIRALOS_IPV6_EHDR_MF_MASK)
 #define NIRALOS_IPV6_GET_FO(x)  ((x) >> NIRALOS_IPV6_EHDR_FO_SHIFT)

 #define NIRALOS_IPV6_SET_FRAG_DATA(fo, mf)  \
     (((fo) & NIRALOS_IPV6_EHDR_FO_MASK) | ((mf) & NIRALOS_IPV6_EHDR_MF_MASK))

#define NIRALOS_ADDR_TYPE_IPV4    4
#define NIRALOS_ADDR_TYPE_IPV6    6

#define NIRALOS_IPV6_BYTE_ADDR_LEN     16
#define NIRALOS_IPV6_WORD_ADDR_LEN     4

/* 128-bit IP6 address */
typedef union niralos_ipv6_addr_ {
    uint8_t     addr8[NIRALOS_IPV6_BYTE_ADDR_LEN];
    uint16_t    addr16[NIRALOS_IPV6_BYTE_ADDR_LEN/2];
    uint32_t    addr32[NIRALOS_IPV6_WORD_ADDR_LEN];
    uint64_t    addr64[NIRALOS_IPV6_WORD_ADDR_LEN/2];
} niralos_ipv6_addr;

typedef uint32_t niralos_ipv4_addr;

/*
 * IP Address Family
 */
typedef union niralos_engine_addr_ {
	niralos_ipv4_addr      ipv4_addr;         /* IPv4 Address */
	niralos_ipv6_addr      ipv6_addr;         /* IPv6 Address */
} niralos_addr_u;

/*
 * Dual Stack IP Address
 */
typedef struct niralos_ip_ {
    uint8_t           type;      /* IP addresss Family Type */
    niralos_addr_u ip_addr;
} niralos_ip;

#define NIRALOS_RESET_IP_ADDR(ip)                            \
do {                                                         \
    (ip).type = 0;                                           \
    (ip).ip_addr.ipv6_addr.addr64[0] = (ip).ip_addr.ipv6_addr.addr64[1] = 0;\
} while(0)

#define IS_IP_TYPE_IPV4(ip)  (ip.type == NIRALOS_ADDR_TYPE_IPV4)

#define IS_IP_TYPE_IPV6(ip)  (ip.type == NIRALOS_ADDR_TYPE_IPV6)

#define NIRALOS_GET_IPV4_ADDR(ip)  (ip).ip_addr.ipv4_addr

#define NIRALOS_SET_IPV4_ADDR(dst, src)                      \
do {                                                         \
    (dst).type = NIRALOS_ADDR_TYPE_IPV4;                     \
    (dst).ip_addr.ipv4_addr = (src);                         \
} while(0)

#define NIRALOS_GET_IPV6_ADDR(dst, src)                      \
do {                                                         \
    memcpy((dst), (src).ip_addr.ipv6_addr.addr8, NIRALOS_IPV6_BYTE_ADDR_LEN);\
} while(0)


#define NIRALOS_SET_IPV6_ADDR(dst, src)                      \
do {                                                         \
    (dst).type = NIRALOS_ADDR_TYPE_IPV6;                     \
    memcpy((dst).ip_addr.ipv6_addr.addr8, (src), NIRALOS_IPV6_BYTE_ADDR_LEN);\
} while(0)

struct ipv4_hdr {
     __extension__
     union {
         unsigned char version_ihl;
         struct {
 #if NIRALOS_BYTE_ORDER == NIRALOS_LITTLE_ENDIAN
        	 unsigned char ihl:4;
        	 unsigned char version:4;
 #elif NIRALOS_BYTE_ORDER == NIRALOS_BIG_ENDIAN
        	 unsigned char version:4;
        	 unsigned char ihl:4;
 #endif
         };
     };
     unsigned char  type_of_service;
     unsigned short total_length;
     unsigned short packet_id;
     unsigned short fragment_offset;
     unsigned char  time_to_live;
     unsigned char  next_proto_id;
     unsigned short hdr_checksum;
     uint32_t src_addr;
     uint32_t dst_addr;
 }  __attribute__((packed));

struct ipv6_hdr {
	 uint32_t vtc_flow;
     unsigned short payload_len;
     unsigned char  proto;
     unsigned char  hop_limits;
     unsigned char  src_addr[16];
     unsigned char  dst_addr[16];
 }  __attribute__((packed));

 struct ipv6_fragment_ext {
	 unsigned char next_header;
	 unsigned char reserved;
	 unsigned short frag_data;
	 uint32_t id;
 }  __attribute__((packed));

 static inline uint8_t niralos_ipv4_hdr_len(const struct ipv4_hdr *ipv4_hdr)
 {
     return (uint8_t)((ipv4_hdr->version_ihl & NIRALOS_IPV4_HDR_IHL_MASK) *
         NIRALOS_IPV4_IHL_MULTIPLIER);
 }

 static inline uint16_t niralos_ipv4_cksum(const struct ipv4_hdr *ipv4_hdr)
 {
     uint16_t cksum;
     cksum = niralos_raw_cksum(ipv4_hdr, niralos_ipv4_hdr_len(ipv4_hdr));
     return (uint16_t)~cksum;
 }

 static inline uint16_t niralos_ipv4_phdr_cksum(const struct ipv4_hdr *ipv4_hdr)
 {
     struct ipv4_psd_header {
         uint32_t src_addr; /* IP address of source host. */
         uint32_t dst_addr; /* IP address of destination host. */
         uint8_t  zero;     /* zero. */
         uint8_t  proto;    /* L4 protocol type. */
         uint16_t len;      /* L4 length. */
     } psd_hdr;

     uint32_t l3_len;

     psd_hdr.src_addr = ipv4_hdr->src_addr;
     psd_hdr.dst_addr = ipv4_hdr->dst_addr;
     psd_hdr.zero = 0;
     psd_hdr.proto = ipv4_hdr->next_proto_id;

     l3_len = NTOHS(ipv4_hdr->total_length);
     psd_hdr.len = HTONS((uint16_t)(l3_len - niralos_ipv4_hdr_len(ipv4_hdr)));

     return niralos_raw_cksum(&psd_hdr, sizeof(psd_hdr));
 }

 static inline uint16_t niralos_ipv6_phdr_cksum(const struct ipv6_hdr *ipv6_hdr, uint64_t ol_flags)
 {
     uint32_t sum;
     struct {
         unsigned int len;   /* L4 length. */
         unsigned int proto; /* L4 protocol - top 3 bytes must be zero */
     } psd_hdr;

     psd_hdr.proto = (uint32_t)(ipv6_hdr->proto << 24);

     psd_hdr.len = ipv6_hdr->payload_len;


     sum = __niralos_raw_cksum(ipv6_hdr->src_addr,
         sizeof(ipv6_hdr->src_addr) + sizeof(ipv6_hdr->dst_addr),
         0);
     sum = __niralos_raw_cksum(&psd_hdr, sizeof(psd_hdr), sum);
     return __niralos_raw_cksum_reduce(sum);
 }

