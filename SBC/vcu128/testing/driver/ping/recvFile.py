import socket
import sys

def receive_file(filename, mac_address, interface):
    """
    Receive a file over Ethernet using raw sockets.
    """
    # Open a raw socket on the specified interface
    s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(0x0003))
    s.bind((interface, 0))
    # Listen for Ethernet frames
    while True:
        packet = s.recvfrom(65535)
        dest_mac = packet[0][0:6]
        src_mac = packet[0][6:12]
       
        #if(packet[0][12:14] == b'\x08\x01'):    
        #    break
        #while True :
        #    # Check if the packet is for us (based on MAC address)
        #    if dest_mac == bytes.fromhex(mac_address.replace(':', '')):
        #        file_data = packet[0][14:] # Ethernet header is 14 bytes
        #        with open(filename, 'a+b') as f:
        #            f.write(file_data)
        #        print("File received and written to disk.")
        #        break
        #    else :
        #        print("addr missmatch")
        #s.send(src_mac + dest_mac+ packet[0][12:])
        s.send(packet[0])
        


n = len(sys.argv)

# Example usage
filename = sys.argv[1]  #"received_file.txt"
open(filename, 'w').close()
mac_address = "04:42:1a:ee:e4:bf" # Our MAC address
interface = "enp4s0" # Network interface to listen on
receive_file(filename, mac_address, interface)

