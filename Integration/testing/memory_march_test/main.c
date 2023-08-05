#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
#include <cortos.h>

#define MEM_START 0x0000
#define MEM_END 0x0700000
#define MEM_DIR -- 
//uint32_t* MEM;

int main()
{
         __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);

	//srand(time(0));
        uint32_t i, val, tmp = 736816,tmp2=352133;
	//MEM = (uint32_t*)(0x100000);
        cortos_printf ("Writing DATA\n");
	uint32_t err =0;
	uint32_t MEM[(MEM_END-MEM_START)>>2];
        cortos_printf ("Writing DATA from 0yy%lx\n", MEM);
        for(i = 0; i < (MEM_END-MEM_START)>>2; i++)
        {
		//uint32_t tmp = rand();
		tmp = tmp^i;
		tmp2 = (tmp2 << 1) ^ (tmp2 >> 3);
		tmp = tmp ^ tmp2;

		
		//cortos_printf("Safely reached %x %x\n",MEM,i);
                MEM[i] = tmp;
		//MEM_LOCAL[i] = tmp;
		//cortos_printf("Safely reached %x %x\n",MEM,i);
                val = MEM[i];
                //if (val != tmp) cortos_printf("ERROR at %u %u\n",i,val);
                //if (val != tmp) err++;
		if ((i&16383) == 0) cortos_printf("Safely reached %x %x \n",MEM,i);

        }
/*
	for(i = 0; i < (MEM_END-MEM_START)>>2; i++)
        {
		tmp = MEM_LOCAL[i];
                val = MEM[i];
                if (val != tmp) cortos_printf("ERROR at %u %u\n",i,val);
                if (val != tmp) err++;
		if ((i&16383) == 0) cortos_printf("Safely reached %x %x \n",MEM,i);

        }
	*/


	cortos_printf("Num errors %u \n",err);
	while(1);
        /*
        cortos_printf ("Reading DATA...\n");
        for(i = MEM_START_ADDR; i < MEM_END; i++)
        {
                cortos_printf ("NIC_REG[%d] = %u\t nic addr = 0x%x\n",i,data,(NIC_REG+i));
        }
*/
	return(0);
}

