import socket

def receive_file(filename, mac_address, interface):
    """
    Receive a file over Ethernet using raw sockets.
    """
    # Open a raw socket on the specified interface
    s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW)
    s.bind((interface, 0))

    # Listen for Ethernet frames
    while True:
        packet = s.recv(65535)
        dest_mac = packet[0:6]
        src_mac = packet[6:12]

        # Check if the packet is for us (based on MAC address)
        if dest_mac == bytes.fromhex(mac_address.replace(':', '')):
            file_data = packet[14:] # Ethernet header is 14 bytes
            with open(filename, 'wb') as f:
                f.write(file_data)
            print("File received and written to disk.")
            break

# Example usage
filename = "received_file.txt"
mac_address = "aa:bb:cc:dd:ee:ff" # Our MAC address
interface = "enp4s0" # Network interface to listen on
receive_file(filename, mac_address, interface)

