import socket

def send_file(filename, dest_mac, src_mac, interface):
    """
    Send a file over Ethernet using raw sockets.
    """
    # Open a raw socket on the specified interface
    s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW)
    s.bind((interface, 0))

    # Read the file contents
    with open(filename, 'rb') as f:
        file_data = f.read()

    # Create the Ethernet frame
    dest_mac_bytes = bytes.fromhex(dest_mac.replace(':', ''))
    src_mac_bytes = bytes.fromhex(src_mac.replace(':', ''))
    eth_header = dest_mac_bytes + src_mac_bytes + b'\x08\x00' # Ethernet type = IPv4
    packet = eth_header + file_data

    # Send the packet
    s.send(packet)
    print("Packet sent!")

# Example usage
filename = "my_file.txt"
dest_mac = "00:11:22:33:44:55" # Destination MAC address
src_mac = "aa:bb:cc:dd:ee:ff" # Source MAC address
interface = "enp4s0" # Network interface to send the packet on
send_file(filename, dest_mac, src_mac, interface)


