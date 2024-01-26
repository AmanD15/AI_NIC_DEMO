#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"

//#define NIC_START_ADDR 0x10000000
//#define NIC_END_ADDR   0x1FFFFFFF
#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1000FFFF

uint32_t* NIC_REG = NIC_START_ADDR;

uint32_t readNicReg(uint32_t);
void writeNicReg(uint32_t, uint32_t);

int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	uint32_t data;
	int err_flg = 0;

	int i;// 16384
	ee_printf ("Writing DATA...\n");
	for(i = 1; i < 64; i++)
	{
		ee_printf ("Writing DATA = %d at nic addr = 0x%x\n",i,(NIC_REG+i));
		writeNicReg(i,i);
		//NIC_REG[i] = i;
	}
	ee_printf ("Reading DATA...\n");
	for(i = 0; i < 64; i++)
	{
		data = readNicReg(i);
		ee_printf ("NIC_REG[%d] = %u\t nic addr = 0x%x\n",i,data,(NIC_REG+i));
	}
	for(i = 0; i < 64; i++)
	{
		data = readNicReg(i);
		ee_printf ("NIC_REG1[%d] = %u\t nic addr = 0x%x\n",i,data,(NIC_REG+i));
	}
	writeNicReg(0,1);
	for(i = 0; i < 64; i++)
	{
		data = readNicReg(i);
		ee_printf ("NIC_REG2[%d] = %u\t nic addr = 0x%x\n",i,data,(NIC_REG+i));
	}

	if(err_flg)
		ee_printf ("DATA MISSMATCH : NIC_REG[%d] = %u, expected = %u:\tnic addr = 0x%x\n",i,data,i,(NIC_REG+i));
	else
		ee_printf ("SUCCESS...!\n");
	return(0);
}

uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	//data = __ajit_load_word_mmu_bypass__(&NIC_REG[index]);
	data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	return data;
}


void writeNicReg(uint32_t index, uint32_t value)
{
	//__ajit_store_word_mmu_bypass__(value,&NIC_REG[index]);
	__ajit_store_word_to_physical_address__(value,&NIC_REG[index]);
}


