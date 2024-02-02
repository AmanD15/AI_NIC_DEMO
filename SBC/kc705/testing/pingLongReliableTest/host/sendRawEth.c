/*
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 */

#include <arpa/inet.h>
#include <linux/if_packet.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <netinet/ether.h>
#include <time.h>

//04 42 1a ee e7 27

#define MY_DEST_MAC0	0x00
#define MY_DEST_MAC1	0x0a
#define MY_DEST_MAC2	0x35
#define MY_DEST_MAC3	0x03 //0x05
#define MY_DEST_MAC4	0x1e //0x76
#define MY_DEST_MAC5	0x50 //0xa0

#define DEFAULT_IF	"eth0"
#define BUF_SIZ		4096


void delay(int number_of_miliseconds)
{
    // Converting time into milli_seconds
    int milli_seconds =  number_of_miliseconds;
 
    // Storing start time
    clock_t start_time = clock();
 
    // looping till required time is not achieved
    while (clock() < start_time + milli_seconds)
        ;
}


int main(int argc, char *argv[])
{

	if(argc < 4)
	{
		printf("USAGE :: ./run.sh [type] <no_of_pkts>\n type : 1 -> continous packets with fix size\n        2 -> no of packets with increasing length\n no_of_pkts : specify no of packtes to be sent.\n");
		return 0;
	}

	int sockfd;
	struct ifreq if_idx;
	struct ifreq if_mac;
	int tx_len = 0;
	char sendbuf[BUF_SIZ],recvbuf[BUF_SIZ];
	struct ether_header *eh = (struct ether_header *) sendbuf;
	struct iphdr *iph = (struct iphdr *) (sendbuf + sizeof(struct ether_header));
	struct sockaddr_ll socket_address;
	socklen_t socket_address_len = sizeof(socket_address);
	int saddr_len = sizeof socket_address;
	char ifName[IFNAMSIZ];

	/* Get interface name */
	if (argc > 1)
		strcpy(ifName, argv[1]);
	else
		strcpy(ifName, DEFAULT_IF);

	/* Open RAW socket to send on */
	if ((sockfd = socket(AF_PACKET, SOCK_RAW, IPPROTO_RAW)) == -1) {
	    perror("socket");
	}

	FILE* ptr;
	char ch;
	 ptr = fopen("test.txt", "r");

	if (NULL == ptr) {
        	printf("file can't be opened \n");
    	}
		
	/* Get the index of the interface to send on */
	memset(&if_idx, 0, sizeof(struct ifreq));
	strncpy(if_idx.ifr_name, ifName, IFNAMSIZ-1);
	if (ioctl(sockfd, SIOCGIFINDEX, &if_idx) < 0)
	    perror("SIOCGIFINDEX");
	/* Get the MAC address of the interface to send on */
	memset(&if_mac, 0, sizeof(struct ifreq));
	strncpy(if_mac.ifr_name, ifName, IFNAMSIZ-1);
	if (ioctl(sockfd, SIOCGIFHWADDR, &if_mac) < 0)
	    perror("SIOCGIFHWADDR");

	/* Construct the Ethernet header */
	memset(sendbuf, 0, BUF_SIZ);
	memset(recvbuf, 0, BUF_SIZ);
	/* Ethernet header */
	eh->ether_shost[0] = ((uint8_t *)&if_mac.ifr_hwaddr.sa_data)[0];
	eh->ether_shost[1] = ((uint8_t *)&if_mac.ifr_hwaddr.sa_data)[1];
	eh->ether_shost[2] = ((uint8_t *)&if_mac.ifr_hwaddr.sa_data)[2];
	eh->ether_shost[3] = ((uint8_t *)&if_mac.ifr_hwaddr.sa_data)[3];
	eh->ether_shost[4] = ((uint8_t *)&if_mac.ifr_hwaddr.sa_data)[4];
	eh->ether_shost[5] = ((uint8_t *)&if_mac.ifr_hwaddr.sa_data)[5];
	eh->ether_dhost[0] = MY_DEST_MAC0;
	eh->ether_dhost[1] = MY_DEST_MAC1;
	eh->ether_dhost[2] = MY_DEST_MAC2;
	eh->ether_dhost[3] = MY_DEST_MAC3;
	eh->ether_dhost[4] = MY_DEST_MAC4;
	eh->ether_dhost[5] = MY_DEST_MAC5;
	/* Ethertype field */
	eh->ether_type = htons(ETH_P_IP);
	tx_len += sizeof(struct ether_header);

	/* Packet data */
	//sendbuf[tx_len++] = 0xde;
	//sendbuf[tx_len++] = 0xad;
	//sendbuf[tx_len++] = 0xbe;
	//sendbuf[tx_len++] = 0xef;

	/* Index of the network device */
	socket_address.sll_ifindex = if_idx.ifr_ifindex;
	/* Address length*/
	socket_address.sll_halen = ETH_ALEN;
	/* Destination MAC */
	socket_address.sll_addr[0] = MY_DEST_MAC0;
	socket_address.sll_addr[1] = MY_DEST_MAC1;
	socket_address.sll_addr[2] = MY_DEST_MAC2;
	socket_address.sll_addr[3] = MY_DEST_MAC3;
	socket_address.sll_addr[4] = MY_DEST_MAC4;
	socket_address.sll_addr[5] = MY_DEST_MAC5;

	int pkt_cnt = 0;
	int i = 0;

    char str[58] = "This is a dummy message no. ";
    char tempBuf[58];
    char seqBuf[10];

	/* Send packet */
	int tot_pkt = atoi(argv[3]);
	int dummy = 0;

	if(atoi(argv[2]) == 1)
	{
		while(pkt_cnt < tot_pkt)
		{
           
			//sendbuf[tx_len++] = pkt_cnt;

             memset(sendbuf,0,strlen(sendbuf));  // Clear sendBuf
             strcpy(tempBuf,str);                // copy original data to temporary buffer :"tempBuf"
             sprintf(seqBuf,"%d",pkt_cnt);       // converting pkt_count to char array sequence buffer: "seqBuf"
             strncat(tempBuf,seqBuf,10);         // attaching pkt_count to packet data.
             strncat(sendbuf,tempBuf,58);        // put everything to sendBuf
            

			// send packet
			if (sendto(sockfd, sendbuf, tx_len, 0, (struct sockaddr *) &socket_address, sizeof(struct sockaddr_ll)) < 0)
			{
				printf("Send failed\n");
			}
			// sent successfully..!
			else
			{
				pkt_cnt++;
				tx_len--;
				clock_t start_time = clock();
				printf("pkt_cnt = %d\n", pkt_cnt);
				while (clock() < start_time + 1000000);//1000000);
			}

			
			
		}
	}
	else if(atoi(argv[2]) == 2)
	{
		while(pkt_cnt < tot_pkt)
		{
			sendbuf[tx_len++] = pkt_cnt;
			// send packet
			if (sendto(sockfd, sendbuf, tx_len, 0, (struct sockaddr *) &socket_address, sizeof(struct sockaddr_ll)) < 0)
			{
				printf("Send failed\n");
			}
			// sent successfully..!
			else
				pkt_cnt++;
		}
	}
	else
	{
		
		int8_t rec_val;
		while(fscanf(ptr,"%hhd",&rec_val) == 1)
			sendbuf[tx_len++] = rec_val;

			if (sendto(sockfd, sendbuf, tx_len, 0, (struct sockaddr *) &socket_address, sizeof(struct sockaddr_ll)) < 0)
			{
				printf("Send failed\n");
			}
			// sent successfully..!
			else
				fclose(ptr);
	}
	return 0;
}




































			/*// read Packet back
			printf("receving pkt\n");
			int count = recvfrom(sockfd, recvbuf, sizeof(recvbuf),0,(struct sockaddr*)&socket_address,(socklen_t *)&saddr_len);//&socket_address_len);
			
			// error
			if(count == -1)
			{
				perror("recvfrom");
				exit(1);
			}
			// oversized packet received
			else if(count == sizeof(recvbuf))
				printf("oversized pkt received");
			// Correct packet reception
			else
				printf("%s",recvbuf);*/
