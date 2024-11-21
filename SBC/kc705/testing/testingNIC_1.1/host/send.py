import socket
import struct
import time

def mac_to_bytes(mac_address):
	return struct.pack('!6B',*[int(x,16) for x in mac_address.split(':')]) 

def send_ethernet_frame(interface, destination_mac, source_mac, ethertype, payload):
    # Create a raw socket
    s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(0x0003))
    
    # Bind the socket to the specified interface
    s.bind((interface, 0))
    
    # Build the Ethernet frame
    ethernet_header = struct.pack('!6s6sH', 
                                  mac_to_bytes(destination_mac),  # Destination MAC address
                                  mac_to_bytes(source_mac),       # Source MAC address
                                  ethertype)                        # Ethernet type
    
    frame = ethernet_header + payload
    
    # Send the frame
    s.send(frame)

if __name__ == "__main__":
    # Configuration
    INTERFACE = "enp2s0"                       # Ethernet interface name
    DESTINATION_MAC = "00:0a:35:03:1e:50"    # Destination MAC address
    SOURCE_MAC = "9c:b6:54:0e:a5:ac"          # Source MAC address
    ETHERTYPE = 0x0800                        # Ethernet type (0x0800 for IPv4)
    
    # Payload (88 bytes)
    payload = b'1234567891234567891234567891234567891234567891234567891234'  # Payload adjusted to 58 bytes

    i=0
    while i<2048:
    	send_ethernet_frame(INTERFACE, DESTINATION_MAC, SOURCE_MAC, ETHERTYPE, payload)
	i=i+1
	print('packet no. '+str(i))
	time.sleep(1)
