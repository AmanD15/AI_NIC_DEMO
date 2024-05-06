#include "arch/cc.h"
u32_t
sys_now(void)
{

  uint64_t numOfClockCycles = ajit_sys_get_clock_time();
  uint32_t time_ms = (numOfClockCycles	* 8 ) / (1000000);		
  return time_ms;
}
