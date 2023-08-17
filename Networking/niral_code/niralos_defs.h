/**
 * NiralOS Utilities
 */

#pragma once

#define NULL               0

#define NIRALOS_SUCCESS    0
#define NIRALOS_ERR       -1

#define NIRALOS_MAX_BUF    64
#define NIRALOS_MAX_IF     4

#define IN_PKT_NUM       5
#define IN_PKT_SIZE      90

static inline uint16_t niralos_bswap16(uint16_t x)
{
	return (uint16_t)(((x & 0x00ffU) << 8) |
		((x & 0xff00U) >> 8));
}

static inline uint32_t niralos_bswap32(uint32_t x)
{
	return  ((x & 0x000000ffUL) << 24) |
		((x & 0x0000ff00UL) << 8) |
		((x & 0x00ff0000UL) >> 8) |
		((x & 0xff000000UL) >> 24);
}

static inline uint64_t niralos_bswap64(uint64_t x)
{
	return  ((x & 0x00000000000000ffULL) << 56) |
		((x & 0x000000000000ff00ULL) << 40) |
		((x & 0x0000000000ff0000ULL) << 24) |
		((x & 0x00000000ff000000ULL) <<  8) |
		((x & 0x000000ff00000000ULL) >>  8) |
		((x & 0x0000ff0000000000ULL) >> 24) |
		((x & 0x00ff000000000000ULL) >> 40) |
		((x & 0xff00000000000000ULL) >> 56);
}

#define NIRALOS_BIG_ENDIAN    1
#define NIRALOS_LITTLE_ENDIAN 2

#define NIRALOS_BYTE_ORDER NIRALOS_BIG_ENDIAN

#if NIRALOS_BYTE_ORDER == NIRALOS_LITTLE_ENDIAN

#define NIRALOS_HTONLL(VAR) niralos_bswap64(VAR)
#define NIRALOS_HTONL(VAR)  niralos_bswap32(VAR)
#define NIRALOS_HTONS(VAR)  niralos_bswap16(VAR)
#define NIRALOS_NTOHLL(VAR) niralos_bswap64(VAR)
#define NIRALOS_NTOHL(VAR)  niralos_bswap32(VAR)
#define NIRALOS_NTOHS(VAR)  niralos_bswap16(VAR)

#elif NIRALOS_BYTE_ORDER == NIRALOS_BIG_ENDIAN

#define NIRALOS_HTONLL(VAR)  VAR
#define NIRALOS_HTONL(VAR)   VAR
#define NIRALOS_HTONS(VAR)   VAR
#define NIRALOS_NTOHLL(VAR)  VAR
#define NIRALOS_NTOHL(VAR)   VAR
#define NIRALOS_NTOHS(VAR)   VAR

#endif


