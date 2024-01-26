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
    # Open a raw socket on the specified interface

    # Read the file contents
    file_data = []
    with open(filename, 'r') as f:
        for line in f:
            file_data.append(int(line))
    # Create the Ethernet frame
    dest_mac_bytes = bytes.fromhex(dest_mac.replace(':', ''))
    src_mac_bytes = bytes.fromhex(src_mac.replace(':', ''))
    eth_header = dest_mac_bytes + src_mac_bytes + b'\x08\x00' # Ethernet type = IPv4
    eth_header_new = dest_mac_bytes + src_mac_bytes + b'\x08\x01' # Ethernet type = IPv4
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
            #    if(flag == 1):
            #        break
            s.send(packet)
            #flag = 0
            sleep(1000/1000000) #100/1000000 for VCU
            print("Packet sent : "+str(i))

    else:
        packet = eth_header + b'\xff\x02'
        for i in range(len(file_data)):
            packet = packet  + file_data[i].to_bytes(1,'big')
        # Send the packet
        s.send(packet)
        flag = 0
        #print("Packet sent!")

    #endpacket = eth_header_new #+ file_data[14:100]
    #s.send(endpacket)

    print("*********** FILE SENT ***********")

def receive_file(s,filename, mac_address):
    """
    Receive a file over Ethernet using raw sockets.
    """
    # Open a raw socket on the specified interface
    #s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(0x0003))
    #s.bind((interface, 0))
    # Listen for Ethernet frames
    while True:
        packet = s.recvfrom(65535)
        dest_mac = packet[0][0:6]
        src_mac = packet[0][6:12]
        if(packet[0][12:14] == b'\x90\x00'):
            flag = 0;
        else:
            flag = 1;
        while flag :
            # Check if the packet is for us (based on MAC address)
            if dest_mac == bytes.fromhex(mac_address.replace(':', '')):
                file_data = packet[0][16:] # Ethernet header is 14 bytes
                with open(filename, 'a') as f:
                    for line in file_data:
                        f.write(str(line)+"\n")
                #print("File received and written to disk.")
                break
            else :
                print("addr missmatch")

        if(packet[0][14:16] == b'\xff\x02' and flag == 1): #12:14   
            break

n = len(sys.argv)
# Example usage
filename = sys.argv[1]
filename1 = sys.argv[2]

open(filename1, 'w').close()
#dest_mac = "04:42:1a:ee:e4:bf" # Destination MAC address
#src_mac = "aa:bb:cc:dd:ee:ff" # Source MAC address
dest_mac = "04:42:1a:ee:e4:bf" # Destination MAC address
src_mac = "aa:bb:cc:dd:ee:ff" # Source MAC address
#send_file(filename, dest_mac, src_mac, interface)

t1 = threading.Thread(target=send_file, args=(s,filename,dest_mac,src_mac))
t2 = threading.Thread(target=receive_file, args=(s,filename1,dest_mac))


t2.start()
t1.start()


t1.join()
t2.join()

print("*********** FILE RECEIVED ***********")

os.system("diff "+filename+" "+filename1)
