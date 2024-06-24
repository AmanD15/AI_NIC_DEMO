#include "../include/arch/sys_arch.h"
#include "lwip/sys.h"
#include <rng_marsaglia.h>
#include <ajit_access_routines.h>

u32_t
sys_now(void)
{
  //cortos_printf("sys_now():\n");
  uint64_t numOfClockCycles,time_ms; 
  numOfClockCycles = __ajit_get_clock_time();
  //cortos_printf("numOfClockCycles = %016llx\n",numOfClockCycles);
  time_ms = (numOfClockCycles	* 8 ) / (1000000);
		
  return ((uint32_t)time_ms);
}

u32_t
lwip_port_rand(void)
{
  uint32_t seed =23;
  uint32_t randNum = (uint32_t)ajit_marsaglia_rng (&seed);
  return randNum;
}

