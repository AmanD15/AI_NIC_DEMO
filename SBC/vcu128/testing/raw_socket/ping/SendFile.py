import sys
import socket
import threading
from time import sleep
import os

flag = 1



interface = "enp2s0" # Network interface to send the packet on
s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(0x0003))
s.bind((interface, 0))

def send_file(s,filename, dest_mac, src_mac):
    """
    Send a file over Ethernet using raw sockets.
    """
    # Read the file contents
    file_data = []
    tmp = []
    line_cnt = 0
    with open(filename, 'r') as f:
        for line in f:
            line_cnt = (line_cnt+1) % 8
            tmp.append(int(line))
            if (line_cnt == 0):
                for i in reversed(tmp):
                    if (i<0):
                        i+=256
                    file_data.append(i)
                    tmp = []
    if (line_cnt != 0):
        for i in reversed(tmp):
            file_data.append(i)
    # Create the Ethernet frame
    dest_mac_bytes = bytes.fromhex(dest_mac.replace(':', ''))
    src_mac_bytes = bytes.fromhex(src_mac.replace(':', ''))
    eth_header = dest_mac_bytes + src_mac_bytes + b'\x08\x00' # Ethernet type = IPv4
    if(len(file_data) > 1496):
        start = 0
        end = len(file_data)
        step = 1496
        for i in range(start, end, step):
            if(end - i <= 1496):
                packet = eth_header + b'\xff\x02'
            else:
                packet = eth_header + b'\xff\x00'
            for j in range(step):
                if (i+j <  end):
                    packet = packet  + file_data[i+j].to_bytes(1,'big')
            #while(flag == 0 ):
            #    x = 2
            #    if(flag == 1):
            #        break
            s.send(packet)
            print("Packet sent : "+str(i))
            #flag = 0
            #sleep(10000/1000000) #100/1000000 for VCU
            while True:
                packet_rcv = s.recvfrom(65535)
                if(packet_rcv[0][12:14] == b'\t\x00'):
                    break;
            print("ACK received : "+str(i))
            '''
            '''

    else:
        packet = eth_header + b'\xff\x02'
        for i in range(len(file_data)):
            packet = packet  + file_data[i].to_bytes(1,'big')
        # Send the packet
        #while(flag == 0 ):
        #    x = 1
        s.send(packet)
        while True:
            packet_rcv = s.recvfrom(65535)
            if(packet_rcv[0][12:14] == b'\t\x00'):
                break;
        #print("Packet sent!")
    print("*********** FILE SENT ***********")

recv_stop = 0
n = len(sys.argv)
# Example usage
filename = sys.argv[1]

src_mac = "04:42:1a:ee:e4:bf" # Destination MAC address
dest_mac = "aa:bb:cc:dd:ee:ff" # Source MAC address


send_file(s,filename, dest_mac, src_mac)

s.close()
