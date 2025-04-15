import socket
import struct
import time
import sys

def mac_to_bytes(mac_address):
    return struct.pack('!6B', *[int(x, 16) for x in mac_address.split(':')])

def mac_to_str(mac_bytes):
    # Ensure input is bytes, not a string
    if isinstance(mac_bytes, str):
        raise ValueError("Input to mac_to_str() must be bytes, not a string.")
    # Converts MAC address bytes to a human-readable string
    return ':'.join('{:02x}'.format(b) for b in mac_bytes)

def send_ethernet_frame(interface, destination_mac, source_mac, ethertype, payload, num_packets, delay):
    try:
        s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype))
        s.bind((interface, 0))

        ethernet_header = struct.pack('!6s6sH',
                                    mac_to_bytes(destination_mac),
                                    mac_to_bytes(source_mac),
                                    ethertype)

        # Initialize variables for throughput calculation
        total_bytes_sent = 0
        packets_sent = 0

        frame = ethernet_header + payload
        print(f"Sending Test Packet (Payload Length: {len(payload)}) at: {time.time()}")
        s.send(frame)

        start_time = time.time()

        for i in range(num_packets):  # Send n packets
            #print(f"Sending Packet {i+1}/{num_packets} (Payload Length: {len(payload)}) at: {time.time()}")
            packets_sent += 1
            s.send(frame)
            time.sleep(delay)

        end_time = time.time()  # End time after all packets are sent
        total_bytes_sent = len(frame) * packets_sent
        time_taken = end_time - start_time if start_time else 0  # Ensure time_taken is only calculated after the test packet
        throughput = total_bytes_sent / time_taken if time_taken > 0 else 0  # Throughput in bytes per second
        throughput_Mbps = (throughput / 1_048_576) * 8 # Convert to Mbps
        print(f"Finished sending {packets_sent} packets with payload length {len(payload)}.")
        print(f"Total bytes sent (including header): {total_bytes_sent}")
        print(f"Time taken (excluding test packet): {time_taken} seconds")
        print(f"Send Throughput: {throughput:.2f} bytes per second.")
        print(f"Send Throughput_Mbps: {throughput_Mbps:.2f} Megabits per second.")

        s.close()

    except socket.error as e:
        print(f"Socket error during send: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"An error occurred during send: {e}")
        sys.exit(1)

        
def receive_ethernet_frame(interface, ethertype_filter, num_packets_to_receive):
    try:
        s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype_filter))
        s.bind((interface, 0))

        # Initialize variables for throughput calculation
        total_bytes_received = 0
        packets_received = 0

        print(f"Listening for packets on {interface} with Ethertype 0x{ethertype_filter:04x}...")
        raw_frame, addr = s.recvfrom(65536)
        print(f"Received Test Packet at {time.time()}")

        start_time = time.time()

        while packets_received < num_packets_to_receive:  # Receive n packets
            try:
            	raw_frame, addr = s.recvfrom(65536)
            	packets_received += 1

            	#print(f"Received Packet {packets_received}/{num_packets_to_receive} at {time.time()}")

            except socket.timeout:
                print("Receive timed out.")
            except Exception as e:
                print(f"Error processing received packet: {e}")

        end_time = time.time()  # End time after receiving all packets
        total_bytes_received = len(raw_frame) * packets_received
        time_taken = end_time - start_time if start_time else 0  # Ensure time_taken is only calculated after the test packet
        throughput = total_bytes_received / time_taken if time_taken > 0 else 0  # Throughput in bytes per second
        throughput_Mbps = (throughput / 1_048_576) * 8 # Convert to Mbps
        print(f"Finished receiving {packets_received} packets.")
        print(f"Total bytes received (including header): {total_bytes_received}")
        print(f"Time taken (excluding test packet): {time_taken} seconds")
        print(f"Receive Throughput: {throughput:.2f} bytes per second.")
        print(f"Receive Throughput_Mbps: {throughput_Mbps:.2f} Megabits per second.")

        s.close()

    except socket.error as e:
        print(f"Socket error during receive: {e}")
        sys.exit(1)

if __name__ == "__main__":
    # Configuration
    INTERFACE = "enp2s0"                      # Ethernet interface name
    DESTINATION_MAC = "00:0a:35:03:1e:50"    # Destination MAC address
    SOURCE_MAC = "9c:b6:54:0e:a5:ac"         # Source MAC address
    ETHERTYPE = 0x88B5                       # Custom Ethertype for raw payloads

    # Run in separate processes or terminals for sending and receiving
    option = input("Enter 'send' to send packets or 'receive' to listen: ").strip().lower()

    if option == "send":
        num_packets, payload_length, delay = map(float, input("Enter num_packets, payload_length, and delay (separated by spaces): ").split())
        num_packets = int(num_packets) # num_packets should be an integer
        payload = b"A" * int(payload_length)  # Payload length should be an integer
        if payload_length > 1500 - 14:
            print(f"Payload length {payload_length} exceeds MTU. Exiting.")
            sys.exit(1)
        send_ethernet_frame(INTERFACE, DESTINATION_MAC, SOURCE_MAC, ETHERTYPE, payload, num_packets, delay)  # Pass delay to function

    elif option == "receive":
        num_packets_to_receive = int(input("Enter the number of packets to receive: "))  # Get number of packets to receive
        receive_ethernet_frame(INTERFACE, ETHERTYPE, num_packets_to_receive)  # Pass this to the function
    else:
        print("Invalid option. Enter 'send' or 'receive'.")

