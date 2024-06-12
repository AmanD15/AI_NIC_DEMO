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
 * This file is part of and a contribution to the lwIP TCP/IP stack.
 *
 * Credits go to Adam Dunkels (and the current maintainers) of this software.
 *
 * Christiaan Simons rewrote this file to get a more stable echo example.
 */

/**
 * @file
 * TCP echo server example using raw API.
 *
 * Echos all bytes sent by connecting client,
 * and passively closes when client is done.
 *
 */

#include "lwip/opt.h"
#include "lwip/debug.h"
#include "lwip/stats.h"
#include "lwip/tcp.h"
#include "tcpecho_raw.h"

#if LWIP_TCP && LWIP_CALLBACK_API

static struct tcp_pcb *tcpecho_raw_pcb;

enum tcpecho_raw_states
{
  ES_NONE = 0,
  ES_ACCEPTED,
  ES_RECEIVED,
  ES_CLOSING,
  ES_DATA,
  ES_STORE,
  ES_CONTROL

};

struct tcpecho_raw_state
{
  u8_t state;
  u8_t retries;
  struct tcp_pcb *pcb;
  /* pbuf (chain) to recycle */
  struct pbuf *p;
};

static void
tcpecho_raw_free(struct tcpecho_raw_state *es)
{
  if (es != NULL) {
    if (es->p) {
      /* free the buffer chain if present */
      pbuf_free(es->p);
    }

    mem_free(es);
  }
}

static void
tcpecho_raw_close(struct tcp_pcb *tpcb, struct tcpecho_raw_state *es)
{
  tcp_arg(tpcb, NULL);
  tcp_sent(tpcb, NULL);
  tcp_recv(tpcb, NULL);
  tcp_err(tpcb, NULL);
  tcp_poll(tpcb, NULL, 0);

  tcpecho_raw_free(es);

  tcp_close(tpcb);
}

static void
tcpecho_raw_send(struct tcp_pcb *tpcb, struct tcpecho_raw_state *es)
{
  struct pbuf *ptr;
  err_t wr_err = ERR_OK;

  while ((wr_err == ERR_OK) &&
         (es->p != NULL) &&
         (es->p->len <= tcp_sndbuf(tpcb))) {
    ptr = es->p;

    /* enqueue data for transmission */
    wr_err = tcp_write(tpcb, ptr->payload, ptr->len, 1);
    if (wr_err == ERR_OK) {
      u16_t plen;

      plen = ptr->len;
      /* continue with next pbuf in chain (if any) */
      es->p = ptr->next;
      if(es->p != NULL) {
        /* new reference! */
        pbuf_ref(es->p);
      }
      /* chop first pbuf from chain */
      pbuf_free(ptr);
      /* we can read more data now */
      tcp_recved(tpcb, plen);
    } else if(wr_err == ERR_MEM) {
      /* we are low on memory, try later / harder, defer to poll */
      es->p = ptr;
    } else {
      /* other problem ?? */
    }
  }
}
//*******************************************************************************



static void
tcp_RECEIVED_STATE(struct tcp_pcb *tpcb, struct tcpecho_raw_state *es)
{
  struct pbuf *ptr;
  uint16_t plen;
  err_t wr_err = ERR_OK;
  

  while (es->p != NULL){

	ptr = es->p;

	/* Do Nothing */
      
	plen = ptr->len;


	/* continue with next pbuf in chain (if any) */
	es->p = ptr->next;

	if(es->p != NULL) {
	/* new reference! */
	pbuf_ref(es->p);
	}

	/* chop first pbuf from chain */
	pbuf_free(ptr);

	/* we can read more data now */
	tcp_recved(tpcb, plen);

	}


 /* enqueue address for transmission, after receiving data */


    char message1[128] = "RECEIVED STATE: Enter 'C' or 'D', to go to Control or Data state: ";
 
    wr_err = tcp_write(tpcb, message1, strlen(message1), 1);
    if (wr_err == ERR_OK) {
	
        /* we can read more data now */
	tcp_recved(tpcb, plen);

	}

}
static void
tcp_CONTROL_STATE(struct tcp_pcb *tpcb, struct tcpecho_raw_state *es)
{
  struct pbuf *ptr;
  uint16_t plen;
  err_t wr_err = ERR_OK;
  

  while (es->p != NULL){

	ptr = es->p;

	/* Do Nothing */
      
	plen = ptr->len;


	/* continue with next pbuf in chain (if any) */
	es->p = ptr->next;

	if(es->p != NULL) {
	/* new reference! */
	pbuf_ref(es->p);
	}

	/* chop first pbuf from chain */
	pbuf_free(ptr);

	/* we can read more data now */
	tcp_recved(tpcb, plen);

	}


 /* enqueue address for transmission, after receiving data */


    char message1[128] = "CONTROL STATE: Enter IP and port (A.B.C.D<space>WXYZ): ";
 
    wr_err = tcp_write(tpcb, message1, strlen(message1), 1);
    if (wr_err == ERR_OK) {
	
        /* we can read more data now */
	tcp_recved(tpcb, plen);

	}

}

static void
tcp_DATA_STATE(struct tcp_pcb *tpcb, struct tcpecho_raw_state *es)
{
  struct pbuf *ptr;
  uint16_t plen;
  err_t wr_err = ERR_OK;
  

  while (es->p != NULL){

	ptr = es->p;

	/* Do Nothing */
      
	plen = ptr->len;


	/* continue with next pbuf in chain (if any) */
	es->p = ptr->next;

	if(es->p != NULL) {
	/* new reference! */
	pbuf_ref(es->p);
	}

	/* chop first pbuf from chain */
	pbuf_free(ptr);

	/* we can read more data now */
	tcp_recved(tpcb, plen);

	}


 /* enqueue address for transmission, after receiving data */


    char message1[128] = "DATA STATE: Enter the offset,data size (<offset>,<num_of_bytes>): ";
 
    wr_err = tcp_write(tpcb, message1, strlen(message1), 1);
    if (wr_err == ERR_OK) {
	
        /* we can read more data now */
	tcp_recved(tpcb, plen);

	}

}



uint32_t* blockAddr;
uint64_t offset=0,numBytes=0;
uint32_t recvdBytes =0;

static void
tcp_STORE_STATE(struct tcp_pcb *tpcb, struct tcpecho_raw_state *es)
{
  struct pbuf *ptr;
  uint16_t plen;
  err_t wr_err = ERR_OK;
  char offst[32];
  char nbytes[32];
  char *ch;
  int i=0,j=0;



	ch = (char*)es->p->payload;

	/* get offset*/
        while(*ch != ',')
		offst[i++] = *ch++;
        offst[i] = '\0';

        ch++;
        /* get Port no. */ 
        while(*ch != '\0')
		nbytes[j++] = *ch++;
        nbytes[j] = '\0';


	offset = atoi(offst);
	numBytes = atoi(nbytes);
  
 /* start receiving data */
  while (es->p != NULL){

	ptr = es->p;

	/* Do Nothing */
      
	plen = ptr->len;


	/* continue with next pbuf in chain (if any) */
	es->p = ptr->next;

	if(es->p != NULL) {
	/* new reference! */
	pbuf_ref(es->p);
	}

	/* chop first pbuf from chain */
	pbuf_free(ptr);

	/* we can read more data now */
	tcp_recved(tpcb, plen);

	}


 /* enqueue address for transmission, after receiving data */


    char message1[128] = "STORE STATE: Ready to receive data at offset: ";
    strcat(message1,offst);
    strcat(message1,"\n");
    wr_err = tcp_write(tpcb, message1, strlen(message1), 1);
    if (wr_err == ERR_OK) {
	
        /* we can read more data now */
	tcp_recved(tpcb, plen);

	}

}




//***************************************************//




static void
tcp_raw_store(struct tcp_pcb *tpcb, struct tcpecho_raw_state *es)
{
  struct pbuf *ptr;


  uint16_t plen;
  err_t wr_err = ERR_OK;
  
  uint8_t* baseAddr = ((uint8_t*)blockAddr) + offset;

  while (es->p != NULL){

	ptr = es->p;

	/* copy data to memory */
      
	memcpy(baseAddr + recvdBytes, ptr->payload, ptr->len);
	recvdBytes += ptr->len;
	plen = ptr->len;


	/* continue with next pbuf in chain (if any) */
	es->p = ptr->next;

	if(es->p != NULL) {
	/* new reference! */
	pbuf_ref(es->p);
	}

	/* chop first pbuf from chain */
	pbuf_free(ptr);

	/* we can read more data now */
	tcp_recved(tpcb, plen);

	}


 /* enqueue address for transmission, after receiving data */

    uint32_t Addr = (uint32_t)blockAddr;

    
    char message1[128] = "DATA STATE: ";
    char message2[32];
    char message3[32];
    lwip_itoa(message2,32,recvdBytes);
    lwip_itoa(message3,32,offset);
    strcat(message1,message2);
    strcat(message1," bytes stored, starting from offset: ");	
    strcat(message1,message3);
    strcat(message1,"\nRECEIVED STATE: Enter 'C' or 'D', to go to Control or Data state: "); 

    wr_err = tcp_write(tpcb, message1, strlen(message1), 1);
    if (wr_err == ERR_OK) {
	cortos_printf("Sent address: 0x%08lx\n",Addr);
        /* we can read more data now */
	tcp_recved(tpcb, plen);

	}

}



/* Control state functions*/

static err_t tcp_client_send(struct tcp_pcb *tpcb, char* data){

	err_t err = tcp_write(tpcb, data, recvdBytes, TCP_WRITE_FLAG_COPY);

		if(err != ERR_OK){
		cortos_printf("tcp_client_send: error sending \n");
		return ;
		}

	err = tcp_output(tpcb);

		if(err != ERR_OK){
		cortos_printf("tcp_client_send: error sending output \n");
		return ;
		}
	recvdBytes = 0;
	cortos_printf("tcp_client_send: data sent\n");
	tcp_close(tpcb);	
   

}




static err_t tcp_client_connected(void *arg, struct tcp_pcb *tpcb,err_t err){

	if(err != ERR_OK){
	cortos_printf("tcp_client_connected: connection error \n");
	return err;
	}

	cortos_printf("tcp_client_connected: connected to server\n");


	// USE BLOCK ADDRESS TO SEND DATA
	char *data = (char*)blockAddr + offset;
	tcp_client_send(tpcb,data);
	return ERR_OK;

	

}





static void
tcp_raw_forward(struct tcp_pcb *tpcb, struct tcpecho_raw_state *es)
{
  struct pbuf *ptr;
  uint16_t plen;	
  err_t wr_err = ERR_OK;
  char IPaddr[32];
  char Port[32];
  char *ch;
  int i=0,j=0,k=0;

  while (es->p != NULL){

	
        ch = (char*)es->p->payload;

	/* get IP address*/
        while(*ch != ' ')
		IPaddr[i++] = *ch++;
        IPaddr[i] = '\0';

        ch++;
        /* get Port no. */ 
        while(*ch != '\0')
		Port[j++] = *ch++;
        Port[j] = '\0';

	/* continue with next pbuf in chain (if any) */
        ptr = es->p;
	es->p = ptr->next;

	if(es->p != NULL) {
	/* new reference! */
	pbuf_ref(es->p);
	}

	/* chop first pbuf from chain */
	pbuf_free(ptr);

	/* we can read more data now */
	tcp_recved(tpcb, plen);

	}

    
    char message1[256] = "CONTROL STATE: IP = ";
    strcat(message1,IPaddr);
    strcat(message1," Port = ");
    strcat(message1,Port); 
    char message2[128] ="RECEIVED STATE: Enter 'C' or 'D', to go to Control or Data state: ";
    strcat(message1,message2);

    wr_err = tcp_write(tpcb, message1, strlen(message1), 1);
    if (wr_err == ERR_OK) {
        /* we can read more data now */
	tcp_recved(tpcb, plen);

	}

    /* Make TCP connection as client and send data to other server */

    struct tcp_pcb *pcb_client = tcp_new_ip_type(IPADDR_TYPE_V4);
     if (tcpecho_raw_pcb == NULL) {

	cortos_printf("client: error creating PCB\n");
	cortos_exit(0);
	}

	
	char A[4] = {0};
	char B[4] = {0};
	char C[4] = {0};
	char D[4] = {0};

	i=0;
	while(IPaddr[k] != '.')
		A[i++] = IPaddr[k++];
	A[i] = '\0';
	k++;

	i=0;
	while(IPaddr[k] != '.')
		B[i++] = IPaddr[k++];
	B[i] = '\0';
	k++;

	i=0;
	while(IPaddr[k] != '.')
		C[i++] = IPaddr[k++];
	C[i] = '\0';
	k++;

	i=0;
	while(IPaddr[k] != ' ')
		D[i++] = IPaddr[k++];
	D[i] = '\0';
	
	
	uint8_t IP[4];
	IP[0] = (uint8_t)atoi(A);
	IP[1] = (uint8_t)atoi(B);
	IP[2] = (uint8_t)atoi(C);
	IP[3] = (uint8_t)atoi(D);





     //ip4_addr_t remote_ip = {{LWIP_MAKEU32(10,107,90,20)}};
     ip4_addr_t remote_ip = {{LWIP_MAKEU32(IP[0],IP[1],IP[2],IP[3])}};
     uint16_t remote_port = (uint16_t)atoi(Port);

      err_t err = tcp_connect(pcb_client,&remote_ip, remote_port,tcp_client_connected);
      if(err != ERR_OK){
	cortos_printf("client: Error initiaing connection\n");
	tcp_close(pcb_client);
	return;
        } 
      cortos_printf("client: connecting to server\n");
  
 
	

}





static err_t
tcpecho_raw_recv(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
  struct tcpecho_raw_state *es;
  err_t ret_err;

  LWIP_ASSERT("arg != NULL",arg != NULL);
  es = (struct tcpecho_raw_state *)arg;

  if (p == NULL) {
    /* remote host closed connection */
    cortos_printf("tcp_raw_recv():NULL state\n");
    es->state = ES_CLOSING;
    if(es->p == NULL) {
      /* we're done sending, close it */
      tcpecho_raw_close(tpcb, es);
    } else {
      /* we're not done yet */
      tcpecho_raw_send(tpcb, es);
    }
    ret_err = ERR_OK;
  } 

  else if(err != ERR_OK) {
    /* cleanup, for unknown reason */
    LWIP_ASSERT("no pbuf expected here", p == NULL);
    ret_err = err;
  }

  else if(es->state == ES_ACCEPTED) {
    /* first data chunk in p->payload */
    cortos_printf("tcp_raw_recv():ACCEPTED state\n");

    es->state = ES_RECEIVED;
    /* store reference to incoming pbuf (chain) */
    es->p = p;

    /* Allocating cache */
    blockAddr = (uint32_t*)cortos_bget(16*1024*1024);

    tcp_RECEIVED_STATE(tpcb, es);
    ret_err = ERR_OK;
  } 

  else if (es->state == ES_RECEIVED) {

    cortos_printf("tcp_raw_recv():RECEIVED state\n");

    char *ch = (char*)p->payload;

	switch(*ch)
	{
		case 'C': es->state = ES_CONTROL  ;
                        cortos_printf("tcp_raw_recv():going to CONTROL state\n");
			 break;
 
		case 'D': es->state = ES_DATA  ; 
			cortos_printf("tcp_raw_recv():going to DATA state\n");
			break; 

		default: es->state = ES_RECEIVED  ; 
			cortos_printf("tcp_raw_recv():going to RECEIVED state\n");
			break; 
	}


    /* read some more data */
    if(es->p == NULL) {
      es->p = p;

	if(es->state == ES_CONTROL)
		tcp_CONTROL_STATE(tpcb, es);

	else if( es->state == ES_DATA)
		tcp_DATA_STATE(tpcb, es);

	else
		tcp_RECEIVED_STATE(tpcb, es);
     
    } else {
      struct pbuf *ptr;
     
      /* chain pbufs to the end of what we recv'ed previously  */
      ptr = es->p;
      pbuf_cat(ptr,p);
    }
    ret_err = ERR_OK;

  } 

  else if (es->state == ES_DATA) {

    cortos_printf("tcp_raw_recv():DATA state\n");
    es->state = ES_STORE;

   
    if(es->p == NULL) {
       
      es->p = p;
      tcp_STORE_STATE(tpcb, es);
      

    } else {
      struct pbuf *ptr;
     
      /* chain pbufs to the end of what we recv'ed previously  */
      ptr = es->p;
      pbuf_cat(ptr,p);
    }
    ret_err = ERR_OK;
  } 

  else if (es->state == ES_STORE) {

    cortos_printf("tcp_raw_recv():DATA state\n");
    es->state = ES_RECEIVED;

   
    if(es->p == NULL) {
       
      es->p = p;
      tcp_raw_store(tpcb, es);
      

    } else {
      struct pbuf *ptr;
     
      /* chain pbufs to the end of what we recv'ed previously  */
      ptr = es->p;
      pbuf_cat(ptr,p);
    }
    ret_err = ERR_OK;
  } 





  else if (es->state == ES_CONTROL) {

    cortos_printf("tcp_raw_recv():CONTROL state\n");
    es->state = ES_RECEIVED;

	
    if(es->p == NULL) {
       
      es->p = p;
      tcp_raw_forward(tpcb, es);
      

    } else {
      struct pbuf *ptr;
     
      /* chain pbufs to the end of what we recv'ed previously  */
      ptr = es->p;
      pbuf_cat(ptr,p);
    }
    ret_err = ERR_OK;
  } 


  else {
    /* unknown es->state, trash data  */
    tcp_recved(tpcb, p->tot_len);
    pbuf_free(p);
    ret_err = ERR_OK;
  }
  return ret_err;
}


//*******************************************************************************

static void
tcpecho_raw_error(void *arg, err_t err)
{
  struct tcpecho_raw_state *es;

  LWIP_UNUSED_ARG(err);

  es = (struct tcpecho_raw_state *)arg;

  tcpecho_raw_free(es);
}

static err_t
tcpecho_raw_poll(void *arg, struct tcp_pcb *tpcb)
{
  err_t ret_err;
  struct tcpecho_raw_state *es;

  es = (struct tcpecho_raw_state *)arg;
  if (es != NULL) {
    if (es->p != NULL) {
      /* there is a remaining pbuf (chain)  */
      tcpecho_raw_send(tpcb, es);
    } else {
      /* no remaining pbuf (chain)  */
      if(es->state == ES_CLOSING) {
        tcpecho_raw_close(tpcb, es);
      }
    }
    ret_err = ERR_OK;
  } else {
    /* nothing to be done */
    tcp_abort(tpcb);
    ret_err = ERR_ABRT;
  }
  return ret_err;
}

static err_t
tcpecho_raw_sent(void *arg, struct tcp_pcb *tpcb, u16_t len)
{
  struct tcpecho_raw_state *es;

  LWIP_UNUSED_ARG(len);

  es = (struct tcpecho_raw_state *)arg;
  es->retries = 0;

  if(es->p != NULL) {
    /* still got pbufs to send */
    tcp_sent(tpcb, tcpecho_raw_sent);
    tcpecho_raw_send(tpcb, es);
  } else {
    /* no more pbufs to send */
    if(es->state == ES_CLOSING) {
      tcpecho_raw_close(tpcb, es);
    }
  }
  return ERR_OK;
}




static err_t
tcpecho_raw_accept(void *arg, struct tcp_pcb *newpcb, err_t err)
{
  err_t ret_err;
  struct tcpecho_raw_state *es;

  LWIP_UNUSED_ARG(arg);
  if ((err != ERR_OK) || (newpcb == NULL)) {
    return ERR_VAL;
  }

  /* Unless this pcb should have NORMAL priority, set its priority now.
     When running out of pcbs, low priority pcbs can be aborted to create
     new pcbs of higher priority. */
  tcp_setprio(newpcb, TCP_PRIO_MIN);

  es = (struct tcpecho_raw_state *)mem_malloc(sizeof(struct tcpecho_raw_state));
  if (es != NULL) {
    es->state = ES_ACCEPTED;
    es->pcb = newpcb;
    es->retries = 0;
    es->p = NULL;
    /* pass newly allocated es to our callbacks */
    tcp_arg(newpcb, es);
    tcp_recv(newpcb, tcpecho_raw_recv);
    tcp_err(newpcb, tcpecho_raw_error);
    tcp_poll(newpcb, tcpecho_raw_poll, 0);
    tcp_sent(newpcb, tcpecho_raw_sent);
    ret_err = ERR_OK;
  } else {
    ret_err = ERR_MEM;
  }
  return ret_err;
}

void
tcpecho_raw_init(void)
{
  tcpecho_raw_pcb = tcp_new_ip_type(IPADDR_TYPE_V4);
  if (tcpecho_raw_pcb != NULL) {
    err_t err;

    ip4_addr_t server_ip = {{LWIP_MAKEU32(10,107,90,23)}}  ;

		
    err = tcp_bind(tcpecho_raw_pcb, &server_ip, 7);
    if (err == ERR_OK) {
      tcpecho_raw_pcb = tcp_listen(tcpecho_raw_pcb);
      tcp_accept(tcpecho_raw_pcb, tcpecho_raw_accept);
      cortos_printf("Server listening on %s : 7 \n",ip4addr_ntoa(&server_ip));
    } else {
      /* abort? output diagnostic? */
	cortos_printf("TCP bind error \n");
    }
  } else {
    /* abort? output diagnostic? */
	cortos_printf("tcpecho_raw_pcb is NULL \n");
  }
}

#endif /* LWIP_TCP && LWIP_CALLBACK_API */
