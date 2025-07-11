import socket
import struct
import time
import sys
import os

# Constants
ETHERNET_HEADER_SIZE = 14
MTU = 1500

def mac_to_bytes(mac_address):
    return struct.pack('!6B', *[int(x, 16) for x in mac_address.split(':')])

def mac_to_str(mac_bytes):
    if isinstance(mac_bytes, str):
        raise ValueError("Input to mac_to_str() must be bytes, not a string.")
    return ':'.join('{:02x}'.format(b) for b in mac_bytes)

def send_ethernet_frame(interface, destination_mac, source_mac, ethertype, payload, num_packets, delay):
    try:
        s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype))
        s.bind((interface, 0))

        ethernet_header = struct.pack('!6s6sH',
                                    mac_to_bytes(destination_mac),
                                    mac_to_bytes(source_mac),
                                    ethertype)

        frame = ethernet_header + payload

        total_bytes_sent = 0
        packets_sent = 0

        start_time = time.perf_counter()

        for i in range(num_packets):
            s.send(frame)
            packets_sent += 1

            if packets_sent % 5 == 0:
                time.sleep(delay)

        end_time = time.perf_counter()
        total_bytes_sent = len(frame) * packets_sent
        time_taken = end_time - start_time
        throughput = total_bytes_sent / time_taken if time_taken > 0 else 0
        throughput_Mbps = (throughput / 1_048_576) * 8

        print(f"\nFinished sending {packets_sent} packets with payload length {len(payload)}.")
        print(f"Total bytes sent (including header): {total_bytes_sent}")
        print(f"Time taken: {time_taken:.6f} seconds")
        print(f"Send Throughput: {throughput:.2f} bytes/sec")
        print(f"Send Throughput: {throughput_Mbps:.2f} Mbps")

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
        s.settimeout(5)

        total_bytes_received = 0
        packets_received = 0

        print(f"Listening on {interface} for Ethertype 0x{ethertype_filter:04x}...")
        print("Waiting for first packet to start timing...")

        # Wait for first packet (optional "test" packet)
        try:
            raw_frame, addr = s.recvfrom(65536)
            print(f"Received first packet at {time.time()}")
        except socket.timeout:
            print("Initial packet receive timed out.")
            sys.exit(1)

        start_time = time.perf_counter()

        while packets_received < num_packets_to_receive:
            try:
                raw_frame, addr = s.recvfrom(65536)
                packets_received += 1
            except socket.timeout:
                print("Receive timed out.")
                break
            except Exception as e:
                print(f"Error receiving packet: {e}")
                break

        end_time = time.perf_counter()
        total_bytes_received = len(raw_frame) * packets_received
        time_taken = end_time - start_time
        throughput = total_bytes_received / time_taken if time_taken > 0 else 0
        throughput_Mbps = (throughput / 1_048_576) * 8

        print(f"\nFinished receiving {packets_received} packets.")
        print(f"Total bytes received (including header): {total_bytes_received}")
        print(f"Time taken: {time_taken:.6f} seconds")
        print(f"Receive Throughput: {throughput:.2f} bytes/sec")
        print(f"Receive Throughput: {throughput_Mbps:.2f} Mbps")

        s.close()

    except socket.error as e:
        print(f"Socket error during receive: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if os.geteuid() != 0:
        print("This script must be run as root.")
        sys.exit(1)

    INTERFACE = "enp2s0"
    DESTINATION_MAC = "00:0a:35:05:76:a0"
    SOURCE_MAC = "9c:b6:54:0e:a5:ac"
    ETHERTYPE = 0x88B5

    option = input("Enter 'send' to send packets or 'receive' to listen: ").strip().lower()

    if option == "send":
        try:
            num_packets, payload_length, delay = map(float, input("Enter num_packets, payload_length, and delay (separated by spaces): ").split())
            num_packets = int(num_packets)
            payload_length = int(payload_length)
            payload = b"A" * payload_length

            if payload_length > MTU - ETHERNET_HEADER_SIZE:
                print(f"Payload length {payload_length} exceeds MTU ({MTU - ETHERNET_HEADER_SIZE} bytes). Exiting.")
                sys.exit(1)

            send_ethernet_frame(INTERFACE, DESTINATION_MAC, SOURCE_MAC, ETHERTYPE, payload, num_packets, delay)
        except ValueError:
            print("Invalid input. Please enter numbers for num_packets, payload_length, and delay.")
    elif option == "receive":
        try:
            num_packets_to_receive = int(input("Enter the number of packets to receive: "))
            receive_ethernet_frame(INTERFACE, ETHERTYPE, num_packets_to_receive)
        except ValueError:
            print("Invalid input. Please enter an integer.")
    else:
        print("Invalid option. Enter 'send' or 'receive'.")

