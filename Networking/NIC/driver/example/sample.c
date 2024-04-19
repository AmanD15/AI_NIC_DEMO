#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <string.h>
#include "cortos.h"
#include "nic_driver.h"

int main(int argc, char* argv[])
{

	// For each NIC in the system {
	//     allocate a Nic Cortos Queue for the
	//     free-queue. from the NCRAM 
	//
	//     Note: message size is 8 bytes (for the PA of buffers)
	//
	//      also remember to allocate the lock
	//      and bget-buffer for the free queue
	//
	// 	keep the VA -> PA translations of the
	// 	queue, lock, bget-buffer
	//
	//	also remember to initialize each
	//      allocated queue
	//
	// }
	
	
	
	// For each NIC {
	//   For each server {
	//       allocate Tx, Rx,  Nic Cortos Queues 
	//
	//     Note: message size is 8 bytes (for the PA of buffers)
	//
	//
	// 	 also remember to allocate the lock
	// 	 and bget-buffer for each rx, tx queue.
	//
	//
	// 	 keep the VA -> PA translations of the
	// 	 queue, lock, bget-buffer
	//
	//	 also remember to initialize each
	//       allocated queue
	//   }
 	// }

	// For each NIC {
	//   set up the NIC config data structure
	//   for each NIC in the system.
	// }


	// For each NIC {
	//     configure it
	// }
	
	// Allocate the buffers and fill the Free Queue.

	//      Note that for each allocation of a buffer,
	//      we need to remember the VA and PA of the
	//      buffer so that a queue entry (which is a PA)
	//      can be translated to its VA.

	// Now enable all the NICs and enjoy.
}
