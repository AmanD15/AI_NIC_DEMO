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

def receive_file(s,filename, mac_address, fileNumber):
    """
    receive a file over ethernet using raw sockets.
    """
    #print(f'Trying to receive File no : {fileNumber}.')
    f = open(filename, 'w')
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

        if(packet[0][14:16] == b'\xff\x02'): #12:14   
            break
    for file_data in packets:
        for line in file_data:
            line_cnt = (line_cnt + 1) % 8
            tmp.append(str(line))
            if(line_cnt == 0):
                for i in reversed(tmp):
                    x = int(i)
                    if (x>127):
                        x-= 256
                    f.write(str(x)+"\n")
                    tmp = []
    if(line_cnt != 0):
        for i in reversed(tmp):
            f.write(i+"\n")

recv_stop = 0
n = len(sys.argv)
# Example usage
filename = sys.argv[1]
fileNumber = sys.argv[2]

src_mac = "04:42:1a:ee:e4:bf" # Destination MAC address
dest_mac = "aa:bb:cc:dd:ee:ff" # Source MAC address


receive_file(s,filename, dest_mac, fileNumber)
print("*********** FILE RECEIVED FOR STAGE "+str(fileNumber)+" **********")

s.close()

#os.system("diff "+filename+" "+filename1)
