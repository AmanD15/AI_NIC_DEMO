/**
 * @file
 * Ethernet Interface Skeleton
 *
 */

/*
 * Copyright (c) 2001-2004 Swedish Institute of Computer Science.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 *
 * Author: Adam Dunkels <adam@sics.se>
 *
 */

/*
 * This file is a skeleton for developing Ethernet network interface
 * drivers for lwIP. Add code to the low_level functions and do a
 * search-and-replace for the word "ethernetif" to replace it with
 * something that better describes your network interface.
 */


#include "../include/ethernetif.h"





void
low_level_init()
{
 
	uint32_t msgs_written;
	uint32_t msgSizeInBytes = 4;
	uint32_t length = 8;
	uint32_t i;

	// Get queues addresses

	free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	rx_queue   = cortos_reserveQueue(msgSizeInBytes, length, 1);
	tx_queue   = cortos_reserveQueue(msgSizeInBytes, length, 1);
		
	cortos_printf("Reserved queues: free=0x%lx, rx=0x%lx, tx=0x%lx\n",
				(uint32_t) free_queue,
				(uint32_t) rx_queue,
				(uint32_t) tx_queue);

				
	// Allocate buffers
	
	
	for(i = 0; i < 8; i++)
	{
		Buffers[i] = (uint32_t*) cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
		cortos_printf("Allocated Buffer[%d] = 0x%lx\n", i,(uint32_t)Buffers[i]);
	}


	// Preparing the allocated buffers, to push into the Q, via cortos_writeMessages

	uint32_t BuffersForQ[8];
	for(i = 0;i < 8; i++)
	BuffersForQ[i] = (uint32_t) Buffers[i];
	
	// Put the four buffers onto the free-queue, so free queue has space, if Tx Q wants to push after transmission.

	for(i = 0; i < 4; i++)
	{
		msgs_written = cortos_writeMessages(free_queue, (uint8_t*) (BuffersForQ + i), 1);
		cortos_printf("Stored Buffer[%d] in free-queue = 0x%lx\n", i, BuffersForQ[i]);
	}


  /* Do whatever else is needed to initialize interface. */
  cortos_printf ("Configuration Done. NIC has started\n");
}
///////////////////////////////////////////////////////////////////////////////////////
/* Following functions are for reception of ethernet frame 

general idea:

ethernetif_input(){
  .....
  low_level_input();
  ....
}

*/

/*
 * Should allocate a pbuf and transfer the bytes of the incoming
 * packet from the interface into the pbuf.
 *
 * @param netif the lwip network interface structure for this ethernetif
 * @return a pbuf filled with the received packet (including MAC header)
 *         NULL on memory error
 */
static struct pbuf *
low_level_input(struct netif *netif)
{
  struct ethernetif *ethernetif = netif->state;
  struct pbuf *p, *q;
  u16_t len;
  u32_t bufptr;
  

  /* Obtain the size of the packet and put it into the "len"
     variable. */
	      
// Read the buffer pointer from RxQ
  int read_ok = cortos_readMessages(rx_queue, (uint8_t*)(&bufptr), 1);
  if(read_ok == 0){
    cortos_printf("failed to read from RxQ\n");
	  return NULL;
  }
  len = 48; // 14 byte header + 34 byte data

#if ETH_PAD_SIZE
  len += ETH_PAD_SIZE; /* allow room for Ethernet padding */
#endif

  /* We allocate a pbuf chain of pbufs from the pool. */
 
  p = pbuf_alloc(PBUF_RAW, len, PBUF_POOL);
 
  if (p != NULL) {

#if ETH_PAD_SIZE
    pbuf_remove_header(p, ETH_PAD_SIZE); /* drop the padding word */
#endif

    /* We iterate over the pbuf chain until we have read the entire
     * packet into the pbuf. */
    for (q = p; q != NULL; q = q->next) {
      /* Read enough bytes to fill this pbuf in the chain. The
       * available data in the pbuf is given by the q->len
       * variable.
       * This does not necessarily have to be a memcpy, you can also preallocate
       * pbufs for a DMA-enabled MAC and after receiving truncate it to the
       * actually received size. In this case, ensure the tot_len member of the
       * pbuf is the sum of the chained pbuf len members.
       */
     // read data into(q->payload, q->len);
        memcpy(q->payload, (uint8_t*)bufptr, q->len);
        bufptr += q->len;
        cortos_printf("q->len = %hu \n",q->len);
    }
   // acknowledge that packet has been read();
  
#if ETH_PAD_SIZE
    pbuf_add_header(p, ETH_PAD_SIZE); /* reclaim the padding word */
#endif

    
  } 

  return p;
}


/**
 * This function should be called when a packet is ready to be read
 * from the interface. It uses the function low_level_input() that
 * should handle the actual reception of bytes from the network
 * interface. Then the type of the received packet is determined and
 * the appropriate input function is called.
 *
 * @param netif the lwip network interface structure for this ethernetif
 */
err_t
ethernetif_input(struct netif *netif)
{
 // struct ethernetif *ethernetif;
  //struct eth_hdr *ethhdr;
  struct pbuf *p;

  //ethernetif = netif->state;

  /* move received packet into a new pbuf */
  p = low_level_input(netif);
  /* if no packet could be read, silently ignore this */
 
  if (p != NULL) {
    /* pass all packets to ethernet_input, which decides what packets it supports */
    if (netif->input(p, netif) != ERR_OK) {
  
      LWIP_DEBUGF(NETIF_DEBUG, ("ethernetif_input: IP input error\n"));
      pbuf_free(p);
      p = NULL;
    }

    if(p != NULL){
    return ERR_OK;
    }
    
  }
}



err_t
low_level_output(struct netif *netif, struct pbuf *p)
{
 // struct ethernetif *ethernetif = netif->state;
  struct pbuf *q;

  uint8_t data[64];
  uint8_t *bufptr = &data[0];
 
  //initiate transfer();

#if ETH_PAD_SIZE
  pbuf_remove_header(p, -ETH_PAD_SIZE); /* drop the padding word */
#endif

  for (q = p; q != NULL; q = q->next) {
    /* Send the data from the pbuf to the interface, one pbuf at a
       time. The size of the data in each pbuf is kept in the ->len
       variable. */
   // send data from(q->payload, q->len);
    memcpy(bufptr,q->payload,q->len);
    bufptr += q->len;
  }

uint32_t BufPtr = (uint32_t)bufptr;  
int write_ok = cortos_writeMessages(tx_queue, (uint8_t*)(&BufPtr) , 1);
 if(write_ok == 0){
   cortos_printf("failed to wrtite to TxQ\n");
	  return 1;
  }
  else
    cortos_printf("netif->linkoutput() or low_level_output(): packet transmitted");

 // signal that packet should be sent();

#if ETH_PAD_SIZE
  pbuf_add_header(p, ETH_PAD_SIZE); /* reclaim the padding word */
#endif

 

  return ERR_OK;
}

err_t 
netif_initialize(struct netif *netif)
{

  /* set MAC hardware address */
  netif->hwaddr_len = ETH_HWADDR_LEN;
  netif->hwaddr[0] = 0x00;
  netif->hwaddr[1] = 0x0a;
  netif->hwaddr[2] = 0x35;
  netif->hwaddr[3] = 0x05;
  netif->hwaddr[4] = 0x76;
  netif->hwaddr[5] = 0xa0;

  /* maximum transfer unit */
  netif->mtu = ETHERNET_MTU; // 1500

  /* device capabilities */
  /* don't set NETIF_FLAG_ETHARP if this device is not an ethernet one */
  netif->flags =  NETIF_FLAG_ETHARP | NETIF_FLAG_ETHERNET ;


  netif->state = NULL;
  netif->name[0] = IFNAME0;
  netif->name[1] = IFNAME1;

  netif->output    =  etharp_output ; 
  netif->linkoutput = low_level_output;

  cortos_printf ("Configuration Done. NIC has started\n");
  return ERR_OK;

}
