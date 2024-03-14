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
	//      also remember to allocate the lock
	//      and bget-buffer for the free queue
	//
	//	also remember to initialize each
	//      allocated queue
	// }
	
	
	
	// For each NIC {
	//   For each server {
	//       allocate Tx, Rx,  Nic Cortos Queues 
	//
	// 	 also remember to allocate the lock
	// 	 and bget-buffer for each rx, tx queue.
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


	// Now enable all the NICs and enjoy.
}
