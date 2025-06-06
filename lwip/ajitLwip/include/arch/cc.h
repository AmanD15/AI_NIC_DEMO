#ifndef LWIP_HDR_CC_H
#define LWIP_HDR_CC_H


#include <stdint.h>
#include <string.h>


#define BYTE_ORDER  BIG_ENDIAN

typedef uint8_t     u8_t;
typedef int8_t      s8_t;
typedef uint16_t    u16_t;
typedef int16_t     s16_t;
typedef uint32_t    u32_t;
typedef int32_t     s32_t;

typedef uintptr_t   mem_ptr_t;

#define LWIP_ERR_T  int

/* Define (sn)printf formatters for these lwIP types */
#define LWIP_NO_INTTYPES_H 1
#define X8_F  "02x" 
#define U16_F "hu"
#define S16_F "hd"
#define X16_F "hx"
#define U32_F "u"
#define S32_F "d"
#define X32_F "x"
#define SZT_F U32_F
/* Compiler hints for packing structures */
#define PACK_STRUCT_FIELD(x)    x
#define PACK_STRUCT_STRUCT  __attribute__((packed))
#define PACK_STRUCT_BEGIN
#define PACK_STRUCT_END

/* Plaform specific diagnostic output */
#ifndef LWIP_PLATFORM_DIAG
#define LWIP_PLATFORM_DIAG(x)   do {                \
        cortos_printf x ;                   \
    } while (0)
#endif

#ifndef LWIP_PLATFORM_ASSERT
#define LWIP_PLATFORM_ASSERT(x) do {                \
        cortos_printf("Assert \"%s\" failed at line %d in %s\n",   \
                x, __LINE__, __FILE__);             \
        cortos_exit(0);                        \
    } while (0)
#endif

#endif
