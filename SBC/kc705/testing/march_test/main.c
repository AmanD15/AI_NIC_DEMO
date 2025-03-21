#include <stdint.h>
#include <stdio.h>
#include <core_portme.h>
#include <ajit_access_routines.h>
#include <cortos.h>


// up to 64 KB
uint32_t  test_array[16*1024];

int runMarch (uint32_t start_addr, uint32_t nwords, int nreps, double* t)
{
	int err = 0;
	cortos_printf("runMarch (0x%x, %d, %d) ...\n", start_addr, nwords, nreps);
	uint64_t tstart = cortos_get_clock_time();
	while (nreps > 0)
	{
		uint32_t I;
		for(I = 0; I < nwords; I++)
		{
			uint32_t* addr = (uint32_t*) (start_addr + (I << 2));
			*addr = I;
		}
		for(I = 0; I < nwords; I++)
		{
			uint32_t* addr = (uint32_t*) (start_addr + (I << 2));
			if(*addr != I)
			{
				err = 1;
			}
		}
		nreps--;
	}
	uint64_t tend = cortos_get_clock_time();

	*t = ((double) (tend - tstart))/((double) CLK_FREQUENCY);
	return(err);
}

int main_00 ()
{

	uint32_t size;
	double t;
	cortos_printf("Cacheable marches...\n");
	for(size = 256; size <= (16*1024); size = size*2)
	{
		double t;
		int err =  runMarch ((uint32_t) test_array, size, NREPS, &t);
		if(err)
			cortos_printf("Error: runMarch (C) size=%d.\n", size);

		cortos_printf ("C  %d  %f\n", size, t/NREPS);
	}
	cortos_printf("Cacheable marches... done.\n");

	cortos_printf("Non-cacheable marches in DRAM\n");
	for(size = 256; size <= (16*1024); size = size*2)
	{
		double t;
		int err =  runMarch ((uint32_t) (NCRAM_BASE), size, NREPS, &t);
		if(err)
			cortos_printf("Error: runMarch (N) size=%d.\n", size);

		cortos_printf ("N  %d  %f\n", size, t/NREPS);
	}
	cortos_printf("Non-cacheable marches in DRAM... done.\n");

	cortos_printf("Non-cacheable march  in NIC registers 1 to 63\n");
	runMarch (((uint32_t) (0xFF000004)), 63, 1024, &t);
		
	cortos_printf ("R  %d  %f\n", 63, t/NREPS);

	cortos_printf("Done.\n");
	return(0);
}

