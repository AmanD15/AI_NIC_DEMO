#include "../include/sys_arch.h"
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
  return (u32_t)rand();
}

