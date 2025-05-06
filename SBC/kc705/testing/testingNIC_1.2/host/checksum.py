import socket
import struct
import time
import sys

# Define the CRC-32 Polynomial (Ethernet CRC-32 Polynomial)
POLYNOMIAL = 0x04C11DB7

def crc32(data: bytes) -> int:
    # Step 1: Append 32 zeros (4 bytes) to the data to account for the CRC field
    data = data + b'\x00' * 4  # Append 4 bytes (32 bits / 8 bits per byte = 4 bytes)

    # Step 2: Initialize CRC value to 0xFFFFFFFF
    crc = 0xFFFFFFFF

    # Step 3: Iterate through each byte in the data
    for byte in data:
        # XOR the byte into the current CRC value (shifted to the left by 24 bits)
        crc ^= (byte << 24)
        
        # Step 4: Process each bit in the byte (8 bits)
        for _ in range(8):
            # If the most significant bit of CRC is 1
            if crc & 0x80000000:
                # Shift CRC left by 1 bit and XOR with the polynomial
                crc = (crc << 1) ^ POLYNOMIAL
            else:
                # Otherwise, just shift CRC left by 1 bit
                crc <<= 1

            # Ensure CRC is within 32 bits (masking with 0xFFFFFFFF)
            crc &= 0xFFFFFFFF

    # Step 5: Invert the final CRC value (bitwise NOT) to get the FCS
    fcs = crc ^ 0xFFFFFFFF

    return fcs

def mac_to_bytes(mac_address):
    return struct.pack('!6B', *[int(x, 16) for x in mac_address.split(':')])

def mac_to_str(mac_bytes):
    if isinstance(mac_bytes, str):
        raise ValueError("Input to mac_to_str() must be bytes, not a string.")
    return ':'.join('{:02x}'.format(b) for b in mac_bytes)

def send_ethernet_frame(interface, destination_mac, source_mac, ethertype, payload, num_packets, delay):  # Added delay parameter
    try:
        s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype))
        s.bind((interface, 0))

        ethernet_header = struct.pack('!6s6sH',
                                    mac_to_bytes(destination_mac),
                                    mac_to_bytes(source_mac),
                                    ethertype)

        packets_sent = 0
        for i in range(num_packets):
            # Calculate FCS (CRC32)
            frame_data = ethernet_header + payload
            fcs_value = crc32(frame_data)  # FCS is the result of CRC-32
            fcs_bytes = struct.pack('!I', fcs_value)  # Convert to 4-byte FCS

            # Complete frame with FCS appended
            frame = frame_data + fcs_bytes

            print(f"Sending packet {i + 1}/{num_packets} (Payload Length: {len(payload)}) at: {time.time()}")
            s.send(frame)
            packets_sent += 1
            time.sleep(delay)  # Use the provided delay

        s.close()
        print(f"Finished sending {packets_sent} packets with payload length {len(payload)}.")

    except socket.error as e:
        print(f"Socket error during send: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"An error occurred during send: {e}")
        sys.exit(1)


def receive_ethernet_frame(interface, ethertype_filter, num_packets_to_receive):  # Added num_packets_to_receive
    try:
        s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype_filter))
        s.bind((interface, 0))

        print(f"Listening for packets on {interface} with Ethertype 0x{ethertype_filter:04x}...")
        packets_received = 0
        while packets_received < num_packets_to_receive:  # Loop until specified number of packets are received
            try:
                raw_frame, addr = s.recvfrom(65536)
                packets_received += 1
                print(f"Packet {packets_received} received at", time.time())

                ethernet_header = raw_frame[:14]
                destination_mac, source_mac, ethertype = struct.unpack('!6s6sH', ethernet_header)

                destination_mac_str = mac_to_str(destination_mac)
                source_mac_str = mac_to_str(source_mac)

                print("Destination MAC: {}".format(destination_mac_str))
                print("Source MAC: {}".format(source_mac_str))
                print("Ethertype: 0x{:04x}".format(ethertype))

                if ethertype == ethertype_filter:
                    payload = raw_frame[14:-4]  # Extract payload (excluding last 4 bytes, which are FCS)
                    received_fcs = struct.unpack('!I', raw_frame[-4:])[0]  # Extract the FCS

                    # Calculate CRC of the frame (without FCS)
                    frame_data = ethernet_header + payload
                    calculated_fcs = crc32(frame_data)

                    print("Received FCS: 0x{:08X}".format(received_fcs))
                    print("Calculated FCS: 0x{:08X}".format(calculated_fcs))

                    # Compare the received FCS with the calculated one
                    if received_fcs == calculated_fcs:
                        print("FCS is correct, no errors detected.")
                    else:
                        print("FCS mismatch! Errors detected in the frame.")
                    
                    # Decode payload if it's UTF-8 or Latin-1
                    try:
                        decoded_payload = payload.decode('utf-8')
                    except UnicodeDecodeError:
                        decoded_payload = payload.decode('latin-1', errors='replace')
                    print("Payload:", decoded_payload)
                else:
                    print("Packet with Ethertype 0x{:04x} ignored".format(ethertype))
                print("-" * 50)

            except socket.timeout:
                print("Receive timed out.")
            except Exception as e:
                print(f"Error processing received packet: {e}")
        print(f"Finished receiving {packets_received} packets.") #Print total packets received

    except socket.error as e:
        print(f"Socket error during receive: {e}")
        sys.exit(1)


if __name__ == "__main__":
    # Configuration
    INTERFACE = "enp2s0"                      # Ethernet interface name
    DESTINATION_MAC = "00:0a:35:03:1e:50"    # Destination MAC address
    SOURCE_MAC = "9c:b6:54:0e:a5:ac"         # Source MAC address
    ETHERTYPE = 0x88B5                       # Custom Ethertype for raw payloads

    option = input("Enter 'send' to send packets or 'receive' to listen: ").strip().lower()

    if option == "send":
        num_packets, payload_length, delay = map(float, input("Enter num_packets, payload_length, and delay (separated by spaces): ").split())
        num_packets = int(num_packets)  # num_packets should be an integer
        payload = b"A" * int(payload_length)  # Payload length should be an integer
        if payload_length > 1500 - 14 - 4:
            print(f"Payload length {payload_length} exceeds MTU. Exiting.")
            sys.exit(1)
        send_ethernet_frame(INTERFACE, DESTINATION_MAC, SOURCE_MAC, ETHERTYPE, payload, num_packets, delay)  # Pass delay to function

    elif option == "receive":
        num_packets_to_receive = int(input("Enter the number of packets to receive: "))
        receive_ethernet_frame(INTERFACE, ETHERTYPE, num_packets_to_receive)  # Pass this to the function
    else:
        print("Invalid option. Enter 'send' or 'receive'.")

