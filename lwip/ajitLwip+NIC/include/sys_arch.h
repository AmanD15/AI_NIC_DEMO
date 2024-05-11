#ifndef LWIP_SYS_ARCH_H
#define LWIP_SYS_ARCH_H
#include "arch/cc.h"
#include <stdlib.h>
#define SYS_MBOX_NULL   NULL
#define SYS_SEM_NULL    NULL

typedef void * sys_prot_t;

typedef void * sys_sem_t;

typedef void * sys_mbox_t;

typedef void * sys_thread_t;

u32_t sys_now(void);
u32_t lwip_port_rand(void);
#endif
