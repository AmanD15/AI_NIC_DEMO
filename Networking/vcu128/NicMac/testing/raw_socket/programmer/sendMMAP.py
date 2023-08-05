import sys
import socket
import threading
from time import sleep
import os
import subprocess



flag = 1



interface = "enp4s0" # Network interface to send the packet on

## without wireshark
subprocess.run(['sudo', 'ifconfig', interface, 'promisc'], check=True)

s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(0x0003))
s.bind((interface, 0))

def send_file(s,filename):
    """
    Send a file over Ethernet using raw sockets.
    """
    # Read the file contents
    file_data = []
    with open(filename, 'r') as f:
        for line in f:
            i = line.split(" ")
            file_data.append(i)
    # Create the Ethernet frame
    #dest_mac_bytes = bytes.fromhex(dest_mac.replace(':', ''))
    #src_mac_bytes = bytes.fromhex(src_mac.replace(':', ''))
    #eth_header = dest_mac_bytes + src_mac_bytes + b'\x08\x00' # Ethernet type = IPv4
    #na = 400//8 #1496
    na = 1024//8
    if(len(file_data) > na):
        start = 0
        end = len(file_data)
        step = na
        packets = []
        packet = b''
        for i in range(start, end, step):
            packet = b''
            for j in range(step):
                if (i+j <  end):
                    addr = int(file_data[i+j][0],16)
                    data = int(file_data[i+j][1],16)
                    packet = packet  + data.to_bytes(4,'little') + addr.to_bytes(4,'little')
                    #packet = data.to_bytes(4,'little') + addr.to_bytes(4,'little')
            #s.send(packet)
            packets.append(packet)
            #sleep(100/1000000) #100/1000000 for VCU
            #print("Packet sent : "+str(i))
            #flag = 0
            #sleep(10000/1000000) #100/1000000 for VCU

    else:
        for i in range(len(file_data)):
            addr = int(file_data[i+j][0])
            data = int(file_data[i+j][1])
            #packet = packet  + addr.to_bytes(1,'big') + data.to_bytes(1,'big')
            packet = packet  + data.to_bytes(4,'little') + addr.to_bytes(4,'little')
        # Send the packet
        #while(flag == 0 ):
        #    x = 1
        s.send(packet)
        #print("Packet sent!")
    
    i = 0
    while (i < len(packets)):
        p = packets[i]
        s.send(p)
        print("Sent packet "+str(i))
        packet_rcv = s.recvfrom(65535)
        i += 1 
    '''    
    for p in packets:
        s.send(p)
        sleep(10000/1000000) #100/1000000 for VCUi
        #x = input("Entre :")
    '''     
    print("*********** FILE SENT ***********")

recv_stop = 0
n = len(sys.argv)
# Example usage
filename = sys.argv[1]

send_file(s,filename)

s.close()
