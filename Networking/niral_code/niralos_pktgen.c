/** Allocate memory and communicate via queue.
*/
#include <math.h>
#include "cortos.h"
#include <niralos_defs.h>
#include <niralos_utils.h>
#include <niralos_pkt_buf.h>
#include <niralos_pkt.h>


uint8_t inq1_pkt[IN_PKT_NUM][IN_PKT_SIZE] = {
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x5E, 0xD8, 0x1B, 0xB9, 0x2A, 0xC0, 0xA8, 0x32, 0x32, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    },
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x5D, 0xD8, 0x1B, 0xB9, 0x2A, 0xC0, 0xA8, 0x32, 0x31, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    },
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x5C, 0xD8, 0x1B, 0xB9, 0x2A, 0xC0, 0xA8, 0x32, 0x30, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    },
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x5B, 0xD8, 0x1B, 0xB9, 0x2A, 0xC0, 0xA8, 0x32, 0x2F, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    },
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x5A, 0xD8, 0x1B, 0xB9, 0x2A, 0xC0, 0xA8, 0x32, 0x2E, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    }
};

uint8_t inq2_pkt[IN_PKT_NUM][IN_PKT_SIZE] = {
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x5D, 0xD8, 0x1B, 0xB9, 0x29, 0xC0, 0xA8, 0x32, 0x32, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    },
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x5C, 0xD8, 0x1B, 0xB9, 0x29, 0xC0, 0xA8, 0x32, 0x31, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    },
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x5B, 0xD8, 0x1B, 0xB9, 0x29, 0xC0, 0xA8, 0x32, 0x30, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    },
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x5A, 0xD8, 0x1B, 0xB9, 0x29, 0xC0, 0xA8, 0x32, 0x2F, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    },
    {
        0x00, 0xD0, 0x59, 0x6C, 0x40, 0x4E, 0x00, 0x0C, 0x41, 0x82, 0xB2, 0x53, 0x08, 0x00, /* Ethernet Header */
        0x45, 0x00, 0x00, 0x4C, 0xA2, 0x22, 0x40, 0x00, 0x32, 0x11, 0x22, 0x59, 0xD8, 0x1B, 0xB9, 0x29, 0xC0, 0xA8, 0x32, 0x2E, /* IPv4 Header */
        0x00, 0x7B, 0x00, 0x7B, 0x00, 0x38, 0x70, 0xE1, /* UDP Header */
        0x1A, 0x02, 0x0A, 0xEE, 0x00, 0x00, 0x07, 0xA4, 0x00, 0x00, 0x0B, 0xA3, 0xA4, 0x43, 0x3E, 0xC2, 0xC5, 0x02, 0x01, 0x81, 0xE5, 0x79, 0x18, 0x19, /* Payload */
        0xC5, 0x02, 0x04, 0xEC, 0xEC, 0x42, 0xEE, 0x92, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x5E, 0x8D, 0x54, 0xC5, 0x02, 0x04, 0xEB, 0xD9, 0x69, 0xB1, 0x74
    }
};

uint16_t pkt_sent = 0;
uint16_t pkt_recv = 0;

uint64_t time_stamp_tx[MAX_TEST_SAMPLE],time_stamp_rx[MAX_TEST_SAMPLE];

void ip_input_pkt_gen(niralos_tcb *tcb) {

    niralos_pktbuf_t  *buf1, *buf2;
    int               i, j = 0;

 
    while (pkt_sent < MAX_TEST_SAMPLE) {
    // Create Packets for tcb_01 and tcb_10
    tcb->pkt_txq[0].num_pkt = tcb->pkt_txq[0].num_pkt = 0;
    for (i = 0; i < 5; i++) {
        buf1 = niralos_pktbuf_alloc();
        buf2 = niralos_pktbuf_alloc();
        if (NULL == buf1 || NULL == buf2) {
            NIRALOS_LOG_ERR(tcb, MOD_PKTIN, "Buffer Allocation Failed - %p, %p", buf1, buf2);
        } else {
            niralos_pktbuf_append_data(buf1, inq1_pkt[i], IN_PKT_SIZE);
            tcb->pkt_txq[0].buf_arr[i] = (uint8_t *)buf1;
	    tcb->pkt_txq[0].num_pkt++;
	    //time_stamp[pkt_sent] = cortos_get_clock_time() & (0xffffffff); //cortos_get_clock_time();
            if(pkt_sent == 0)	time_stamp_tx[pkt_sent] = cortos_get_clock_time();
	    //cortos_printf("time 1 is %u,%u \n",time_stamp[pkt_sent],__ajit_get_clock_time());
            //buf1->meta.test_idx = pkt_sent++; 
	    pkt_sent++;
	    
	    
	    niralos_pktbuf_append_data(buf2, inq2_pkt[i], IN_PKT_SIZE);
            tcb->pkt_txq[0].buf_arr[i] = (uint8_t *)buf2;
	    tcb->pkt_txq[0].num_pkt++;
            //time_stamp[pkt_sent] = cortos_get_clock_time() & (0xffffffff); //cortos_get_clock_time();
            //time_stamp_tx[pkt_sent] = cortos_get_clock_time();
            //cortos_printf("time 2 is %u,%u \n",time_stamp[pkt_sent],__ajit_get_clock_time());
	    //buf2->meta.test_idx = pkt_sent++; 
	    pkt_sent++;
        }
    }
    tcb->pkt_txq[0].tot_pkt = tcb->pkt_txq[0].num_pkt;
    tcb->pkt_txq[0].tot_pkt = tcb->pkt_txq[0].num_pkt;
    // Enqueue to Input Q of tcb_01 and tcb_10
    i = niralos_pkt_enqueue(&tcb->pkt_txq[0]);
   NIRALOS_LOG_DEBUG(tcb, MOD_PKTIN, "%d pkts of size %d written for IP Routing in Core 0 Thread 1 Input Q %p",
                      i, niralos_pktbuf_len(buf1), tcb->pkt_txq[0].qptr);
               
    i = niralos_pkt_enqueue(&tcb->pkt_txq[0]);
    NIRALOS_LOG_DEBUG(tcb, MOD_PKTIN, "%d pkts of size %d written for IP Routing in Core 1 Thread 0 Input Q %p",
                      i, niralos_pktbuf_len(buf2), tcb->pkt_txq[0].qptr);            
    }
    //NIRALOS_LOG_PRINT(tcb, MOD_PKTIN, "Sent %u packets", pkt_sent);
   // cortos_printf("Sent %u packets", pkt_sent);
    return;
}


void ip_output_pkt_rcv(niralos_tcb *tcb) {

    niralos_pktbuf_t  *buf;
    int               i, count;
    uint64_t          total_latency = 0;
    double 	      avg_latency;


    while (pkt_recv < MAX_TEST_SAMPLE) {
    	tcb->pkt_rxq.num_pkt = IN_PKT_NUM;
        count = niralos_pkt_dequeue(&tcb->pkt_rxq);
        NIRALOS_LOG_DEBUG(tcb, MOD_PKTOUT, "%d Pkts received for IP Transmission in Core 1 Thread 1 Input Q %p",
        		          count, tcb->pkt_rxq.qptr);

    	// Free all the Packets received from tcb_01 and tcb_10
    	for (i = 0; i < count; i++) {
            buf = (niralos_pktbuf_t *)tcb->pkt_rxq.buf_arr[i];
     //      NIRALOS_LOG_PRINT(tcb, MOD_PKTOUT, "Recv Pkt %p of len %u, meta %u for Transmission No. %d and Timestamp: %u",
       //     		          buf, niralos_pktbuf_len(buf), buf->meta.test_idx, ++pkt_recv, time_stamp[buf->meta.test_idx]);
            pkt_recv +=1;
            //time_stamp[buf->meta.test_idx] = cortos_get_clock_time() & (0xffffffff) - time_stamp[buf->meta.test_idx];                  
	    //cortos_printf("test_idx = %u\n", buf->meta.test_idx);
            //time_stamp_rx[buf->meta.test_idx] = cortos_get_clock_time();              
            niralos_pktbuf_free(buf);
    	}
	time_stamp_rx[pkt_recv - 1] = cortos_get_clock_time();
    }

    /*int j;
    uint32_t RX1,RX0,TX1,TX0;	
    for(j =0 ; j < pkt_recv; j++){
		RX1 = time_stamp_rx[j] >> 32; 
		RX0 = time_stamp_rx[j] & 0xffffffff;
		TX1 = time_stamp_tx[j] >> 32;
		TX0 = time_stamp_tx[j] & 0xffffffff;
		NIRALOS_LOG_PRINT(tcb, MOD_PKTOUT, "PKT_NO = %u : {rx1,rx0} = %u%u, {tx1,tx0} = %u%u}\n",j,RX1,RX0,TX1,TX0);
    }*/

    /*for (i = 0; i < pkt_recv; i++) {
       // NIRALOS_LOG_PRINT(tcb, MOD_PKTOUT, "Pkt Delay for idx %u is %lx", i, time_stamp[i]);
        total_latency += time_stamp_rx[i]-time_stamp_tx[i];
    }*/
    //total_latency = time_stamp_rx[pkt_recv-1] - time_stamp_tx[0];

    uint32_t rx1,rx0,tx1,tx0;
    rx1 = time_stamp_rx[0] >> 32;
    rx0 = time_stamp_rx[0] & 0xffffffff;
    tx1 = time_stamp_tx[0] >> 32;
    tx0 = time_stamp_tx[0] & 0xffffffff;

    total_latency += time_stamp_rx[0] - time_stamp_tx[0];

    NIRALOS_LOG_PRINT(tcb, MOD_PKTOUT, "PKT_CNT = %u : {rx1,rx0} = %u%u, {tx1,tx0} = %u%u\n",pkt_recv,rx1,rx0,tx1,tx0);
    NIRALOS_LOG_PRINT(tcb, MOD_PKTOUT, "Lateny in microsec = %lf\n",total_latency * 1.0e-2);


    //avg_latency = (double)(total_latency/pkt_recv);
    //double t = ((double) (total_latency)) * 1.0e-8;
    //NIRALOS_LOG_PRINT(tcb, MOD_PKTOUT, "Avg. Pkt Latency for %u packets is %lf seconds  and %lu  ticks \n", pkt_recv, t,total_latency);
    return;
}
