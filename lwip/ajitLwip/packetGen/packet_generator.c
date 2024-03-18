#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <arpa/inet.h> // For htons and inet_addr functions

// Ethernet header structure
struct EthernetHeader {
    uint8_t destination[6];
    uint8_t source[6];
    uint16_t type;
};

// IP header structure
struct IPHeader {
    uint8_t version_ihl;
    uint8_t dscp_ecn;
    uint16_t total_length;
    uint16_t identification;
    uint16_t flags_fragment_offset;
    uint8_t ttl;
    uint8_t protocol;
    uint16_t header_checksum;
    uint32_t source_ip;
    uint32_t dest_ip;
};

// ICMP header structure
struct ICMPHeader {
    uint8_t type;
    uint8_t code;
    uint16_t checksum;
    uint16_t identifier;
    uint16_t sequence_number;
    // Add any additional fields here
};

// Function to calculate checksumh
uint16_t calculateChecksum(uint16_t *data, int length) {
    uint32_t sum = 0;
    for (int i = 0; i < length / 2; i++) {
        sum += data[i];
        if (sum & 0x80000000) // If sum exceeds 16 bits, wrap around
            sum = (sum & 0xFFFF) + (sum >> 16);
    }
    while (sum >> 16) // Fold 32-bit sum to 16 bits
        sum = (sum & 0xFFFF) + (sum >> 16);
    return ~sum;
}

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
    // Create an Ethernet frame buffer
    uint8_t ethernetFrame[1514]; // Maximum Ethernet frame size

    // Construct Ethernet header
    struct EthernetHeader *ethHeader = (struct EthernetHeader *)ethernetFrame;
    // Fill in destination MAC address
    memcpy(ethHeader->destination, "\x00\x0a\x35\x05\x76\xa0", 6); // Example MAC address
    // Fill in source MAC address
    memcpy(ethHeader->source, "\x66\x77\x88\x99\xaa\xbb", 6); // Example MAC address
    ethHeader->type = htons(0x0800); // IP type

    // Construct IP header within the Ethernet frame
    uint8_t *ipPacket = ethernetFrame + sizeof(struct EthernetHeader);
    struct IPHeader *ipHeader = (struct IPHeader *)ipPacket;
    ipHeader->version_ihl = 0x45; // IPv4, Header Length = 5 (20 bytes)
    ipHeader->dscp_ecn = 0;
    ipHeader->identification = htons(1234); // Example identification
    ipHeader->flags_fragment_offset = 0;
    ipHeader->ttl = 64; // Time to live
    ipHeader->protocol = 1; // ICMP protocol
    ipHeader->header_checksum = 0; // Placeholder for checksum, calculated later
    ipHeader->source_ip = inet_addr("192.168.1.100"); // Example source IP address
    ipHeader->dest_ip = inet_addr("192.168.1.102"); // Example destination IP address

    // Construct ICMP packet within the Ethernet frame
    uint8_t *icmpPacket = ipPacket + sizeof(struct IPHeader);
    struct ICMPHeader *icmpHeader = (struct ICMPHeader *)icmpPacket;
    icmpHeader->type = 8; // ICMP Echo Request type
    icmpHeader->code = 0; // ICMP Echo Request code
    icmpHeader->checksum = 0; // Set checksum field to 0 before calculating checksum
    icmpHeader->identifier = htons(1234); // Example identifier
    icmpHeader->sequence_number = htons(1); // Example sequence number

    // Add ICMP ping request data (8 bytes)
    char pingData[] = "Hello";
    int pingDataLength = strlen(pingData) + 1; // Include null terminator
    memcpy(icmpPacket + sizeof(struct ICMPHeader), pingData, pingDataLength);

    // Calculate ICMP total length (header + data)
    int icmpTotalLength = sizeof(struct ICMPHeader) + pingDataLength;

    // Calculate total length of IP packet (IP header + ICMP header + ICMP data)
    ipHeader->total_length = htons(sizeof(struct IPHeader) + icmpTotalLength);

    // Calculate IP header checksum
    ipHeader->header_checksum = calculateChecksum((uint16_t *)ipPacket, sizeof(struct IPHeader));

    // Calculate ICMP checksum
    icmpHeader->checksum = calculateChecksum((uint16_t *)icmpPacket, icmpTotalLength);

    // Print the constructed Ethernet frame
    printf("//Constructed Ethernet Header:\n");
    printEthernetFrame(ethernetFrame, 0, sizeof(struct EthernetHeader),6);

    printf("//Constructed IP Header:\n");
    printEthernetFrame(ethernetFrame, sizeof(struct EthernetHeader),sizeof(struct EthernetHeader) + sizeof(struct IPHeader),4);


    printf("//Constructed ICMP Header:\n");
    printEthernetFrame(ethernetFrame, sizeof(struct EthernetHeader) + sizeof(struct IPHeader),
				      sizeof(struct EthernetHeader) + sizeof(struct IPHeader) + sizeof(struct ICMPHeader),4);

    printf("//Constructed ICMP Data:\n");
    printEthernetFrame(ethernetFrame, sizeof(struct EthernetHeader) + sizeof(struct IPHeader) + sizeof(struct ICMPHeader),
				      sizeof(struct EthernetHeader) + sizeof(struct IPHeader) + sizeof(struct ICMPHeader)+ strlen(pingData) + 1 ,4);

printf("size of ethernet header = %d\n",sizeof(struct EthernetHeader));
printf("size of ip header = %d\n",sizeof(struct IPHeader));

    return 0;
}
