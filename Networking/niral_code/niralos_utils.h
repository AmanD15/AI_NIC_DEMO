/**
 * NiralOS Utilities
 */

#pragma once

#include "cortos.h"
#include "niralos_defs.h"

#define NIRALOS_ALLOC cortos_bget
#define NIRALOS_FREE  cortos_brel

#define MAX_TEST_SAMPLE   750

#define MOD_INIT          "INIT"
#define MOD_MEM           "MEM"
#define MOD_PKTIN         "PKTIN"
#define MOD_ROUTE         "ROUTE"
#define MOD_PKTOUT        "PKTOUT"


#if 1

#define NIRALOS_LOG_ALL(tcb, mod, msg, ...)   
#define NIRALOS_LOG_TRACE(tcb, mod, msg, ...)
#define NIRALOS_LOG_DEBUG(tcb, mod, msg, ...)
#define NIRALOS_LOG_ERR(tcb, mod, msg, ...)
#define NIRALOS_LOG_CRIT(tcb, mod, msg, ...)

#else
#define NIRALOS_LOG_ALL(tcb, mod, msg, ...)   CORTOS_ALL(mod"-%u-%u:%s:"msg, tcb->core_id, tcb->thread_id, __FUNCTION__, ##__VA_ARGS__)
#define NIRALOS_LOG_TRACE(tcb, mod, msg, ...) CORTOS_TRACE(mod"-%u-%u:%s:"msg, tcb->core_id, tcb->thread_id,  __FUNCTION__, ##__VA_ARGS__)
#define NIRALOS_LOG_DEBUG(tcb, mod, msg, ...) CORTOS_DEBUG(mod"-%u-%u:%s:"msg, tcb->core_id, tcb->thread_id,  __FUNCTION__, ##__VA_ARGS__)
#define NIRALOS_LOG_ERR(tcb, mod, msg, ...)   CORTOS_ERROR(mod"-%u-%u:%s:"msg, tcb->core_id, tcb->thread_id,  __FUNCTION__, ##__VA_ARGS__)
#define NIRALOS_LOG_CRIT(tcb, mod, msg, ...)  CORTOS_CRITICAL(mod"-%u-%u:%s:"msg, tcb->core_id, tcb->thread_id,  __FUNCTION__, ##__VA_ARGS__)
#endif

#define NIRALOS_LOG_PRINT(tcb, mod, msg, ...) CORTOS_TRACE(mod"-%u-%u:%s:"msg, tcb->core_id, tcb->thread_id,  __FUNCTION__, ##__VA_ARGS__)

typedef struct niralos_pktq_s {
	CortosQueueHeader                 *qptr;
    /* Num of packet in buf_arr pending to be processed */
    uint32_t                          num_pkt;
    uint8_t                           *buf_arr[NIRALOS_MAX_BUF];

    /* Total Packet Processed */
    unsigned int     tot_pkt;
} niralos_pktq;

static inline CortosQueueHeader* niralos_queue_init()
{
	return cortos_reserveQueue(sizeof(uint32_t), 4096, 1);
}

static inline int niralos_pkt_enqueue(niralos_pktq *tx_queue)
{
    uint8_t count;

	count = cortos_writeMessages(tx_queue->qptr, (uint8_t *)tx_queue->buf_arr, tx_queue->num_pkt);

    return count;
}

static inline unsigned int niralos_pkt_dequeue(niralos_pktq *rx_queue)
{
	uint8_t count;
	count = cortos_readMessages(rx_queue->qptr, (uint8_t *)rx_queue->buf_arr, rx_queue->num_pkt);

	rx_queue->num_pkt = count;

	return count;
}

static inline uint32_t
__niralos_raw_cksum(const void *buf, uint16_t len, uint32_t sum)
{
    /* extend strict-aliasing rules */
    typedef uint16_t __attribute__((__may_alias__)) u16_p;
    const u16_p *u16_buf = (const u16_p *)buf;
    const u16_p *end = u16_buf + len / sizeof(*u16_buf);

    for (; u16_buf != end; ++u16_buf)
        sum += *u16_buf;

    /* if length is odd, keeping it byte order independent */
    if (unlikely(len % 2)) {
        uint16_t left = 0;
        *(unsigned char *)&left = *(const unsigned char *)end;
        sum += left;
    }

    return sum;
}

static inline uint16_t __niralos_raw_cksum_reduce(uint32_t sum)
{
    sum = ((sum & 0xffff0000) >> 16) + (sum & 0xffff);
    sum = ((sum & 0xffff0000) >> 16) + (sum & 0xffff);
    return (uint16_t)sum;
}

static inline uint16_t niralos_raw_cksum(const void *buf, uint16_t len)
{
    uint32_t sum;

    sum = __niralos_raw_cksum(buf, len, 0);
    return __niralos_raw_cksum_reduce(sum);
}


