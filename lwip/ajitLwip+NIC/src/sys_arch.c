#include "../include/sys_arch.h"
#include <rng_marsaglia.h>
u32_t
sys_now(void)
{

  uint64_t numOfClockCycles = ajit_sys_get_clock_time();
  uint32_t time_ms = (numOfClockCycles	* 8 ) / (1000000);		
  return time_ms;
}

u32_t
lwip_port_rand(void)
{
  uint32_t seed =23;
  uint32_t randNum = (uint32_t)ajit_marsaglia_rng (&seed);
  return randNum;
}

