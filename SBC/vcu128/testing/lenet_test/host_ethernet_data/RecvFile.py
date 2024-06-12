import sys
import socket
import threading
from time import sleep
import os
import subprocess

interface = "enp4s0" # Network interface to send the packet on
## without wireshark
subprocess.run(['sudo', 'ifconfig', interface, 'promisc'], check=True)

s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(0x0003))
s.bind((interface, 0))

def receive_file(s,filename, mac_address):
    """
    receive a file over ethernet using raw sockets.
    """
    #print(f'Trying to receive File no : {fileNumber}.')
    f = open(filename, 'a')
    packets = []
    tmp = []
    line_cnt = 0
    addr = bytes.fromhex(mac_address.replace(':', ''))
    # listen for ethernet frames
    while True:
        packet = s.recvfrom(65535)
        dest_mac = packet[0][0:6]
        while True:
            # check if the packet is for us (based on mac address)
            if dest_mac ==  addr:
                file_data = packet[0][16:] # ethernet header is 14 bytes
                packets.append(file_data)
                break
            else :
                print("addr missmatch")
                print("Received Address ",dest_mac)
                print("Expected Address", addr)
                break

        if(packet[0][14:16] == b'\xff\x02'): #12:14   
            break
    # print(packets)
    # for file_data in packets:
    file_data = packets[0]
    print(type(file_data))
    final_result = []
    for line in file_data:
        line_cnt = (line_cnt + 1)
        tmp.append(str(line))
        if((line_cnt%8) == 0):
            # print(tmp)
            for i in reversed(tmp):
                x = int(i)
                if (x>127):
                    x-= 256
                # f.write(str(x)+"\n")
                final_result.append(x)
                tmp = []
        if line_cnt == 16:
            break

    for i in range(10):
        f.write(str(final_result[i])+"\n")


recv_stop = 0
n = len(sys.argv)
# Example usage
filename = sys.argv[1]
# fileNumber = sys.argv[2]

src_mac = "04:42:1a:ee:e4:bf" # Destination MAC address
dest_mac = "aa:bb:cc:dd:ee:ff" # Source MAC address


receive_file(s,filename, dest_mac)
print("*********** FILE RECEIVED **********")

s.close()

#os.system("diff "+filename+" "+filename1)
