#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
#include <math.h>

#define TESTLENGTH 256
#define NSWEEPS    16

// mapped to VA_DATA_SECTION_START  + 0x10000 for low mem
// mapped to VA_DATA_SECTION_START at 0x40040000 and above for high mem
unsigned int *noncacheable_mem = (unsigned int *) (VA_DATA_SECTION_START + 0x2000); 
unsigned int *bypass_mem       = (unsigned int *) (VA_DATA_SECTION_START + 0x3000); 
unsigned int *cacheable_mem    = (unsigned int *) (VA_DATA_SECTION_START + 0x4000); 

float convertToSeconds(long ut)
{
	float result = (256.0/CLK_FREQUENCY)*((float)ut);
	return result;
}

int march_test (int bypass_flag, unsigned int* a, int length)
{
	int err = 0;
	int i;
		for(i=0; i < length; i++)
		{
			if(bypass_flag)
			{
				__ajit_store_word_mmu_bypass__((uint32_t) i,(uint32_t) (a + i));
			}
			else
			{
				*(a+i) = i;
			}
		}
		for(i=0; i < length; i++)
		{
			if(bypass_flag)
			{
				uint32_t v = __ajit_load_word_mmu_bypass__((uint32_t) (a + i));
				if(v != i)
					err = 1;
			}
			else
			{
				if(*(a+i) != i)
					err = 1;
			}
		}
#ifdef EXPAND		
    for (i = 0; i < length; i++)
    {
    		if(bypass_flag)
			{
				uint32_t v = __ajit_load_word_mmu_bypass__((uint32_t) (a + i));
				ee_printf("\t Value stored at bypassed location 0x%x is : %d\r\n",(a + i),v);
			}
				else
			{
				ee_printf("\t Value stored at location 0x%x is : %d\r\n",(a + i),i);
			}
    }
#endif 
	return(err);
}

int march_test_byte (int bypass_flag, uint8_t* a, int length)
{
	int err = 0;
	int i;
	for(i=0; i < length; i++)
	{
		if(bypass_flag)
		{
			__AJIT_STORE_UBYTE_MMU_BYPASS__(((uint32_t) (a + i)), ((uint8_t) (i & 0xff)));
		}
		else
		{
			*(a+i) = i & 0xff;
		}
	}
	for(i=0; i < length; i++)
	{
		if(bypass_flag)
		{
			uint32_t v;
			__AJIT_LOAD_UBYTE_MMU_BYPASS__(((uint32_t) (a+i)), v);
			if(v != (i & 0xff))
				err = 1;
		}
		else
		{
			if(*(a+i) != (i & 0xff))
				err = 1;
		}
	}
	return(err);
}

int march_test_i2c_slave_ram ()
{
	int I;
	int ret_val = 0;
	
	ajit_configure_i2c_master (80000000, 400000);
	for(I  = 0; I < 256; I++)
	{
		ajit_i2c_master_access_slave_memory_device (0x38, 0, 	(uint8_t) I, (uint8_t) I);
	}
	for(I  = 0; I < 256; I++)
	{
		uint8_t R = ajit_i2c_master_access_slave_memory_device (0x38, 1, (uint8_t) I, 0);
		if(R != I)
		{
			ret_val = 1;
			ee_printf("Error: i2c march expected %d, received %d.\n", I, R);		
			break;
		}
	}
	return(ret_val);
}

int flash_march_test (int nbytes, int offset)
{
	int ret_val = 0;
	int I;
	for (I = 0; I < nbytes; I++)
	{
		*((uint8_t*) I) = (I  + offset) & 0xff;
	}

	uint8_t J;
	for (I = 0; I < nbytes; I++)
	{
		J = *((uint8_t*) I);
		if(J != ((I  + offset) & 0xff))
		{
			ee_printf("Error: flash march expected [%d] = %d, received %d.\n",
					I, J, (I+offset)&0xff);
			ret_val = 1;
		}
	}
	return(ret_val);
}

AjitHwThreadDescriptor td;

int main()
{

	__ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);

#ifndef VA_DATA_SECTION_START
	ee_printf("Error: virtual address of data section not specified\n");		
	return(1);
#endif

#ifndef CLK_FREQUENCY
	ee_printf("Error: virtual clock frequency not specified\n");		
	return(1);
#endif
	ajit_read_thread_descriptor(&td);
	ee_printf("Thread Descriptor\n");		
	ee_printf("  %d %d %d %d %d %d %d %d %d %d %d %d %d \n", 
					td.l1_dcache_size_in_KB, td.l1_icache_size_in_KB,
					td.log_dcache_associativity, td.log_icache_associativity,
					td.l1_dcache_hit_latency, td.l1_icache_hit_latency,
					td.log_mmu_l3_tlb_size, td.log_mmu_l2_tlb_size,
					td.log_mmu_l1_tlb_size, td.log_mmu_l0_tlb_size,
					td.has_noncacheable_bypass_path, td.has_two_threads,
					td.implements_isa_64);		

	int err = 0;
	uint32_t t0 = ajit_barebones_clock();
	int I;
	for(I = 0; I < NSWEEPS; I++)
	{
		err = march_test(0,noncacheable_mem,TESTLENGTH/4);
		if(err)
		{
			ee_printf("Error non-cacheable\n");
		}
	}
	uint32_t t1 = ajit_barebones_clock();
	ee_printf("Non-cacheable: Time in ticks = %u\n",(t1 - t0));


	t0 = ajit_barebones_clock();
	for(I = 0; I < NSWEEPS; I++)
	{
		err = march_test(1,bypass_mem,TESTLENGTH/4);
		if(err)
		{
			ee_printf("Error bypass\n");
		}
	}
	t1 = ajit_barebones_clock();
	ee_printf("Bypass: Time in ticks = %u\n",(t1 - t0));


	t0 = ajit_barebones_clock();
	for(I = 0; I < NSWEEPS; I++)
	{
		err = march_test(0,cacheable_mem,TESTLENGTH/4);
		if(err)
		{
			ee_printf("Error cacheable\n");
		}
	}
	t1 = ajit_barebones_clock();
	ee_printf("Cacheable: Time in ticks = %u\n",(t1 - t0));

	err = march_test_byte(0,(uint8_t*) noncacheable_mem,TESTLENGTH);
	if(err)
	{
		ee_printf("Error non-cacheable byte\n");
	}
	err = march_test_byte(1,(uint8_t*) bypass_mem,TESTLENGTH);
	if(err)
	{
		ee_printf("Error bypass byte\n");
	}
	err = march_test_byte(0,(uint8_t*) cacheable_mem,TESTLENGTH);
	if(err)
	{
		ee_printf("Error cacheable byte\n");
	}

  	ee_printf("Started march-test run for bypass memory\n");
  	err = march_test(1,bypass_mem,TESTLENGTH/4);
  	if(err)
   	{
    		ee_printf("Error bypass\n");
   	}
  	else if(err==0)
   	{ 
	 	ee_printf("\tFinished march-test for by-passed locations\n"); 
	 }
	ee_printf("Started march-test run for non-cacheable memory\n");
	err = march_test(0,noncacheable_mem,TESTLENGTH/4);
	if(err)
	{ 
		ee_printf("Error in non-cacheable locations\n"); 
	}
	else if(err==0)
	{ 
		ee_printf("\tFinished march-test for non-cacheable locations\n"); 
	}       

	ee_printf("\tDone with word-sized march tests \r\n");
	ee_printf("\r\tStarting with byte-sized march test \r\n"); 
	err = march_test_byte(0,(uint8_t*) noncacheable_mem,TESTLENGTH);
	if(err)
	{
		ee_printf("Error non-cacheable byte\n");
	}
	else
	{
		ee_printf("\tFinished byte-sized march-test for non-cacheable locations\n");
	}

	err = march_test_byte(1,(uint8_t*) bypass_mem,TESTLENGTH);
	if(err)
	{
		ee_printf("Error bypass byte\n");
	}
	else
	{
		ee_printf("\tFinished byte-sized march-test for bypassed locations\n");
	}
	err = march_test_byte(0,(uint8_t*) cacheable_mem,TESTLENGTH);
	if(err)
	{
		ee_printf("Error cacheable byte\n");
	}
	else
	{
		ee_printf("\tFinished byte-sized march-test for cacheable locations\n");
	}				

	err = march_test_i2c_slave_ram();
	ee_printf("%s: i2c march completed%s\n", (err ? "Error": "Info"), (err ? " with error." : ""));

	/*
	t0 = ajit_barebones_clock();
	err = flash_march_test (4096, 1);
	t1 = ajit_barebones_clock();
	ee_printf("First flash march: Time in ticks = %u\n",(t1 - t0));

	t0 = ajit_barebones_clock();
	err = flash_march_test (4096, 33);
	t1 = ajit_barebones_clock();
	ee_printf("Second flash march: Time in ticks = %u\n",(t1 - t0));
	ee_printf("done\n");
	*/

}

