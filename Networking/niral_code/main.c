/** Allocate memory and communicate via queue.
*/
#include <math.h>
#include "cortos.h"
#include <niralos_defs.h>
#include <niralos_utils.h>
#include <niralos_pkt.h>

/*
 *   Packet Flow Structure
 *
 *                  INQA --->  tcb_01 --->
 *                 /                      \
 *     tcb_00 --->                         ---> INQC ---> tcb_11
 *                 \                      /
 *                   INQB ---> tcb_10 --->
 *
 */


/* Task Structure for the Router */
niralos_tcb tcb_00;
niralos_tcb tcb_01;
niralos_tcb tcb_10;
niralos_tcb tcb_11;

/* Queues for the Router */
CortosQueueHeader *pkt_inq_a;
CortosQueueHeader *pkt_inq_b;
CortosQueueHeader *pkt_inq_c;

void main() {} // important, but keep empty.

/* Router Initialization */
void ip_router_init() {

	niralos_tcb       *tcb = &tcb_00;
	ajit_get_core_and_thread_id(&tcb->core_id, &tcb->thread_id);

	pkt_inq_a = niralos_queue_init();
	pkt_inq_b = niralos_queue_init();
	pkt_inq_c = niralos_queue_init();

	NIRALOS_LOG_DEBUG(tcb, MOD_PKTIN, "Queue Init: INQA - %p, INQB - %p, INQC - %p",
			pkt_inq_a, pkt_inq_b, pkt_inq_c);

}

/* Thread that generates the Packet */
void ip_router_pkt_gen_00() {

    niralos_tcb       *tcb = &tcb_00;
    // Update tcb_00
    tcb->pkt_txq[0].qptr = pkt_inq_a;
    tcb->pkt_txq[0].qptr = pkt_inq_b;
    ajit_get_core_and_thread_id(&tcb->core_id, &tcb->thread_id);

    ip_input_pkt_gen(tcb);

    cortos_exit(0); //safely exit
}

/* Worker Thread 1 doing Eouting of the Packet */
void ip_router_worker_thread_01() {

    niralos_tcb       *tcb = &tcb_01;

    // Update tcb
    tcb->pkt_rxq.qptr = pkt_inq_a;
    tcb->pkt_txq[0].qptr = pkt_inq_c;
    ajit_get_core_and_thread_id(&tcb->core_id, &tcb->thread_id);

    while(1) {
    	// Process the IPv4 Packet
	    niralos_pkt_scheduler(tcb);

	    // Enqueue to tcb_11
    }
    cortos_exit(0); //safely exit
}

/* Worker Thread 2 doing Eouting of the Packet */
void ip_router_worker_thread_10() {

    niralos_tcb       *tcb = &tcb_10;

    // Update tcb
    tcb->pkt_rxq.qptr = pkt_inq_b;
    tcb->pkt_txq[0].qptr = pkt_inq_c;
    ajit_get_core_and_thread_id(&tcb->core_id, &tcb->thread_id);

    while(1) {
    	// Process the IPv4 Packet
	    niralos_pkt_scheduler(tcb);

	    // Enqueue to tcb_11
    }
    cortos_exit(0); //safely exit
}

/* Tx Thread for Packet Transmission */
void ip_router_pkt_rx_11() {

    niralos_tcb       *tcb = &tcb_11;

    // Update tcb
    tcb->pkt_rxq.qptr = pkt_inq_c;
    ajit_get_core_and_thread_id(&tcb->core_id, &tcb->thread_id);
    ip_output_pkt_rcv(tcb);

    cortos_exit(0); //safely exit
}

