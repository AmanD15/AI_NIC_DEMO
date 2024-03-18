#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <arpa/inet.h> // For htons and inet_addr functions
// Ethernet header structure
struct EthernetHeader {
    uint8_t destination[6];
    uint8_t source[6];
    uint16_t type;
}__attribute__((packed));

// ARP header structure
struct ARPHeader {
    uint16_t hardware_type;
    uint16_t protocol_type;
    uint8_t hardware_addr_length;
    uint8_t protocol_addr_length;
    uint16_t opcode;
    uint8_t sender_mac[6];
    uint32_t sender_ip;
    uint8_t target_mac[6];
    uint32_t target_ip;
}__attribute__((packed));



// Function to print Ethernet frame
void printEthernetFrame(uint8_t *ethernetFrame, int start,int length,int tab) {

    int count =0;
    for (int i = start; i < length; i++) {
        printf("0x%02X, ", ethernetFrame[i]);
	count ++;
        if (count%tab == 0)
            printf("\n");
    }
    printf("\n");
}

int main() {
    // ARP response packet buffer
    uint8_t arpResponsePacket[42]; // ARP response packet size: 14 bytes for Ethernet header + 28 bytes for ARP header

    // Construct Ethernet header
    struct EthernetHeader *ethHeader = (struct EthernetHeader *)arpResponsePacket;
    // Fill in destination MAC address (e.g., broadcast)
    memcpy(ethHeader->destination, "\x00\x0a\x35\x05\x76\xa0", 6); // Broadcast MAC address
    // Fill in source MAC address
    memcpy(ethHeader->source, "\x66\x77\x88\x99\xaa\xbb", 6); // Example MAC address
    ethHeader->type = htons(0x0806); // ARP type

    // Construct ARP header
    struct ARPHeader *arpHeader = (struct ARPHeader *)(arpResponsePacket + sizeof(struct EthernetHeader));
    arpHeader->hardware_type = htons(1); // Ethernet
    arpHeader->protocol_type = htons(0x0800); // IPv4
    arpHeader->hardware_addr_length = 6; // MAC address length
    arpHeader->protocol_addr_length = 4; // IPv4 address length
    arpHeader->opcode = htons(2); // ARP response
    memcpy(arpHeader->sender_mac, "\x66\x77\x88\x99\xaa\xbb", 6); // Example sender MAC address
    arpHeader->sender_ip = inet_addr("192.168.1.100"); // Example sender IP address (192.168.1.100)
    memcpy(arpHeader->target_mac, "\x00\x0a\x35\x05\x76\xa0", 6); // Target MAC address not needed for response
    arpHeader->target_ip = inet_addr("192.168.1.102"); // Example target IP address (192.168.1.102)

    // Print the constructed ARP response packet
    printf("Constructed ARP response packet:\n");

    printf("//Constructed Ethernet Header:\n");
    printEthernetFrame(arpResponsePacket, 0, 14,6);

    printf("//Constructed ARP Response:\n");
    printEthernetFrame(arpResponsePacket, 14, 42,4);

    printf("size of ethernet header = %ld\n",sizeof(struct EthernetHeader));
    printf("size of arp header = %ld\n",sizeof(struct ARPHeader));

    return 0;
}
