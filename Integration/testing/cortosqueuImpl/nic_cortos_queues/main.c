#include "decl.h"
#include <cortos_locks.h>
#include <cortos_queues.h>
#include <cortos_utils.h>
#include <cortos_bget.h>

#define QUEUE_ALIGNMENT 16

void* cortos_bget_ncram1(cortos_bufsize size){
	void* base = cortos_bget_ncram(size);
	cortos_printf("Allocated %u to %u\n",(uint8_t*)base,(uint8_t*)base+size);
	return base;

}	

CortosQueueHeader*
cortos_reserveQueue2(uint32_t msgSizeInBytes, uint32_t length, uint8_t nc) {
  uint8_t* queue = 0;
  uint32_t size = sizeof(CortosQueueHeader) + (msgSizeInBytes * length);
  if (nc) {
    queue = (uint8_t*)cortos_bget_ncram(size + QUEUE_ALIGNMENT);
  } else {
    queue = (uint8_t*)cortos_bget(size + QUEUE_ALIGNMENT);
  }
  if (queue == 0) return 0;

  // QUEUE_ALIGNMENT related - align properly
  uint32_t rem = ((uint32_t)queue) % QUEUE_ALIGNMENT;

  // initialize the queue header
  CortosQueueHeader *hdr;
  cortos_printf("Entering %d %d\n",msgSizeInBytes, hdr->msgSizeInBytes);
  hdr = (CortosQueueHeader*) (queue + (QUEUE_ALIGNMENT - rem));
  hdr->totalMsgs = 0;
  hdr->readIndex = 0;
  hdr->writeIndex = 0;
  hdr->msgSizeInBytes = msgSizeInBytes;
  hdr->length = length;
  hdr->lock = cortos_reserveLock(1);
  hdr->bget_addr = queue; // original address returned by bget
  hdr->misc = 0;

  cortos_printf("hdr %d\n", hdr);
  cortos_printf("msgSizeInBytes %d\n", hdr->msgSizeInBytes);
  cortos_printf("totalMsgs %d\n", hdr->totalMsgs);
  cortos_printf("readIndex %d\n", hdr->readIndex);
  cortos_printf("writeIndex %d\n", hdr->writeIndex);
  cortos_printf("lock addr %d\n", hdr->lock);
  cortos_printf("lock val %d\n", *hdr->lock);
  cortos_printf("length %d\n", hdr->length);
  cortos_printf("bget_addr %d\n", hdr->bget_addr);
  cortos_printf("misc %d\n", hdr->misc);
  return hdr;
}

uint32_t cortos_writeMessages2(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count) {
  uint8_t *dest = 0, *src = 0; // nullptr
  uint32_t process = count;
  uint32_t i;
  cortos_printf("%x\n",hdr);
  cortos_printf("%x\n",*(uint32_t*)msgs);

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_acquire_buzy(hdr->lock);
  } else {
    if (hdr->totalMsgs > 0) 
    {	    
	    return 0; // write only when total msgs are zero
  }}

  uint32_t totalMsgs      = hdr->totalMsgs;
  uint32_t writeIndex     = hdr->writeIndex;
  uint32_t length         = hdr->length;
  uint32_t msgSizeInBytes = hdr->msgSizeInBytes;
  uint8_t* queuePtr       = (uint8_t*)(hdr + 1);

  cortos_printf("Entering %d %d\n",msgSizeInBytes, hdr->msgSizeInBytes);
  while ((process > 0) && (totalMsgs < hdr->length)) {
  cortos_printf("Entered loop %d %d %d\n",process,totalMsgs, hdr->length);
    src  = msgs + (msgSizeInBytes * (count - process));
    dest = queuePtr + (msgSizeInBytes * writeIndex);
  cortos_printf("Entering for loop %d\n",msgSizeInBytes);
    for (i = 0; i < msgSizeInBytes; ++i) {
	cortos_printf("Writing %lx at %lx from %lx\n",*(src+i),dest+i,src+i);
      *(dest+i) = *(src+i);                     // WRITE THE MESSAGE HERE
    }
    writeIndex = (writeIndex+1) % length;
    ++totalMsgs; --process;
  }

  hdr->writeIndex = writeIndex;
  hdr->totalMsgs  = totalMsgs;

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_release(hdr->lock);
  }
  return (count - process);
}

int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	
	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 64;
	CortosQueueHeader* free_queue;
	CortosQueueHeader* tx_queue; 
	CortosQueueHeader* rx_queue; 

	rx_queue = cortos_reserveQueue2(msgSizeInBytes, length, 1);
	tx_queue = cortos_reserveQueue2(msgSizeInBytes, length, 1);
	free_queue = cortos_reserveQueue2(msgSizeInBytes, length, 1);
	//NicQueue NQ = generateNicQueue(msgSizeInBytes,length),*NQ2;
	//NQ2 = &NQ;
	cortos_printf("Free = 0x%lx and size is %d(in bytes)\n", free_queue,free_queue->msgSizeInBytes*free_queue->length);
	cortos_printf("tx = 0x%lx and size is %d(in bytes)\n", tx_queue,tx_queue->msgSizeInBytes*tx_queue->length);
	cortos_printf("rx = 0x%lx and size is %d(in bytes)\n", rx_queue,rx_queue->msgSizeInBytes*rx_queue->length);
	cortos_printf("Free->msgSizeInBYtes = %d\n", free_queue->msgSizeInBytes);

	// allocate buffers
	uint32_t* Buffers[64];
	uint32_t* file_buf;
	file_buf = (uint32_t*)cortos_bget_ncram(FILE_BUF_SIZE);
	cortos_printf("file_buf addr = 0x%lx and its size is %di(in bytes)\n", file_buf, FILE_BUF_SIZE);
	int i;
	for(i = 0; i < length; i++)
	{
		Buffers[i] = (uint32_t*)cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
		cortos_printf("Buffers[%d] = 0x%lx and size is %d(in bytes)\n", i, Buffers[i],BUFFER_SIZE_IN_BYTES);
	}



	if((msgs_written = cortos_writeMessages2(free_queue, Buffers, length-20) != (length - 20)))
		cortos_printf("Unable to push all msgs to free queue.\n");
	
	//while(1);
	for(i = 0; i < length; i++)
	{
		cortos_printf("free_queue[%d] = 0x%lx\n", i, *((uint32_t*)(free_queue+1) + i));
	}

	cortos_printf("free_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n", free_queue ->readIndex, free_queue -> writeIndex, free_queue -> totalMsgs);

	readNicRegs();
	nicRegConfig(free_queue,rx_queue,tx_queue);
	writeNicReg(2,rx_queue);
	// start nic
	writeNicReg(0,1);
	readNicRegs();

	cortos_printf("Free = 0x%lx\n", free_queue);
	cortos_printf("Tx = 0x%lx\n", tx_queue);
	cortos_printf("Rx = 0x%lx\n", rx_queue);
	//while(1);	

	ee_printf ("Configuration Done. NIC has started\n");

	int start = 1, cnt = 1;
	int last_written_index;

	while(1)
	{
		getConfigData(file_buf, free_queue,rx_queue, &last_written_index);

		//printBuffer(file_buf, FILE_BUF_SIZE);

		// send file out
		cortos_printf("sending file out\n");
		sendFile(file_buf,free_queue, tx_queue, last_written_index);
		start = 1;
		cnt++;
		if(cnt > 18)
			break;
	}
	
	// free queue
	cortos_freeQueue(rx_queue);	
	cortos_freeQueue(tx_queue);	
	cortos_freeQueue(free_queue);

	// release buffers
	for(i = 0; i < 64; i++)
	{
		cortos_brel(Buffers[i]);
	}
	cortos_brel(file_buf);
	cortos_printf("Done\n");
	return(0);
}


















	/*while(1){
		uint32_t* data[1];
	
		if(cortos_readMessages(rx_queue, (uint8_t*)data, 1))
		{

			uint32_t* buf_addr = (uint32_t*)data[0];
			
			// store file
			printBuffer(buf_addr, BUFFER_SIZE_IN_BYTES);
			storeFile(&start, file_buf, buf_addr, &last_written_index);
			//cortos_printf("last_written_index = %d\n", last_written_index);
			
			// send ack	
			// *(buf_addr + 1) = 92 << 8;
			// *(buf_addr + 8) |= (1 < 8);	
			//msgs_written = cortos_writeMessages(tx_queue, (uint8_t*)data, 1);
			msgs_written = cortos_writeMessages(free_queue, (uint8_t*)data, 1);
			if((*(buf_addr + 8)>>25) & 0x1 == 1 )
				break;
		}	
		else
		{
			int k = 0;
			for(k = 0; k < 2500000; k++);
			//cortos_printf("No packet found empty rx_queue\n");
		}
	}*/


