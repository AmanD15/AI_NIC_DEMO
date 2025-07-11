import socket
import struct
import time
import select
import argparse
import numpy as np

def mac_to_bytes(mac_address):
    return struct.pack('!6B', *[int(x, 16) for x in mac_address.split(':')])

def send_ethernet_frame(s, destination_mac, source_mac, ethertype, payload):
    ethernet_header = struct.pack('!6s6sH',
                                 mac_to_bytes(destination_mac),
                                 mac_to_bytes(source_mac),
                                 ethertype)
    frame = ethernet_header + payload
    s.send(frame)
        
def receive_packet(s, timeout=1.0):
    ready_to_read, _, _ = select.select([s], [], [], timeout)
    if ready_to_read:
        data, addr = s.recvfrom(1514)  # Adjust buffer size as needed (1514 for full Ethernet frame)
        return data
    return None  # Timeout
    
def calculate_rtt(interface, dest_mac, src_mac, ethertype, payload, packets_to_send=10):
    rtt_times = []
    packets_transmitted = 0
    packets_received = 0
    start_time_total = time.time()  # Start timing the whole process

    # Create a socket and bind it only once, before starting the loop
    with socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype)) as s_recv:
        s_recv.bind((interface, 0))

        # Create the socket for sending frames only once
        with socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype)) as s_send:
            s_send.bind((interface, 0))

            for i in range(packets_to_send):
                start_time = time.time()  # Time just before sending the packet

                # Send the Ethernet frame (we reuse the socket s_send for sending)
                send_ethernet_frame(s_send, dest_mac, src_mac, ethertype, payload)
                packets_transmitted += 1

                received_data = receive_packet(s_recv)  # Receive the response

                if received_data:
                    end_time = time.time()  # Time when the response is received
                    rtt = (end_time - start_time) * 1000  # Calculate RTT in milliseconds
                    rtt_times.append(rtt)
                    packets_received += 1
                    print(f"Packet {i+1} sent and received. RTT: {rtt:.3f} ms")
                else:
                    print(f"Packet {i+1} sent. Timeout waiting for response.")

                #time.sleep(1)  # Small delay between packets

    end_time_total = time.time()  # End timing the whole process
    total_time = (end_time_total - start_time_total) * 1000  # Total time in milliseconds

    packet_loss = ((packets_transmitted - packets_received) / packets_transmitted) * 100 if packets_transmitted > 0 else 0

    print("\n--- Statistics ---")
    print(f"Packets transmitted: {packets_transmitted}")
    print(f"Packets received: {packets_received}")
    print(f"Packet loss: {packet_loss:.2f}%")
    print(f"Total time: {total_time/1000:.3f} s") # Print total time in seconds

    if rtt_times:
        min_rtt = min(rtt_times)
        max_rtt = max(rtt_times)
        avg_rtt = sum(rtt_times) / len(rtt_times)
        stdev_rtt = np.std(rtt_times)
        print(f"RTT min/avg/max/stdev = {min_rtt:.3f}/{avg_rtt:.3f}/{max_rtt:.3f}/{stdev_rtt:.3f} ms")
    else:
        print("No RTT data available.")

def generate_default_payload(payload_length):
    base_payload = "0123456789ABCDEF"
    repeats = (payload_length // len(base_payload)) + 1  # Repeat enough times to exceed length
    return (base_payload * repeats)[:payload_length]  # Slice to exactly the desired length

if __name__ == "__main__":
    # Default values
    DEFAULT_INTERFACE = "enp2s0"  
    DEFAULT_DESTINATION_MAC = "00:0a:35:05:76:a0"  
    DEFAULT_SOURCE_MAC = "9c:b6:54:0e:a5:ac"  
    DEFAULT_ETHERTYPE = 0x88B5
    DEFAULT_PAYLOAD = "0123456789ABCDEF"  # Default payload string

    parser = argparse.ArgumentParser(description="Send custom Ethernet frames.")
    parser.add_argument("-i", "--interface", default=DEFAULT_INTERFACE, help="Ethernet interface name")
    parser.add_argument("-d", "--destination", default=DEFAULT_DESTINATION_MAC, help="Destination MAC address")
    parser.add_argument("-s", "--source", default=DEFAULT_SOURCE_MAC, help="Source MAC address")
    parser.add_argument("-p", "--payload", type=str, default=DEFAULT_PAYLOAD, help="Payload string")
    parser.add_argument("-n", "--packets", type=int, default=10, help="Number of packets")
    parser.add_argument("-l", "--length", type=int, default=58, help="Payload length")
    parser.add_argument("-e", "--ethertype", type=lambda x: int(x, 16), default=DEFAULT_ETHERTYPE, help="Ethertype (hex)") # Allow hex input
    args = parser.parse_args()

    INTERFACE = args.interface
    DESTINATION_MAC = args.destination
    SOURCE_MAC = args.source
    ETHERTYPE = args.ethertype

    # Generate payload based on the length
    payload_string = args.payload if args.payload != DEFAULT_PAYLOAD else generate_default_payload(args.length)
    payload_length = args.length
    payload = payload_string.encode('utf-8')
    if len(payload) < payload_length:
        payload += b"\0" * (payload_length - len(payload))

    calculate_rtt(INTERFACE, DESTINATION_MAC, SOURCE_MAC, ETHERTYPE, payload, args.packets)

