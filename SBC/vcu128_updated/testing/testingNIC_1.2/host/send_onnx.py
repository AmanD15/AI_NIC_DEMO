import socket
import struct
import time
import sys
import os

# Convert MAC address between string and bytes
def mac_to_bytes(mac_address):
    return struct.pack('!6B', *[int(x, 16) for x in mac_address.split(':')])

def mac_to_str(mac_bytes):
    return ':'.join('{:02x}'.format(b) for b in mac_bytes)

# Send ONNX file in Ethernet frames
def send_onnx_file(interface, destination_mac, source_mac, ethertype, file_path, chunk_size=1400):
    try:
        s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype))
        s.bind((interface, 0))

        ethernet_header = struct.pack('!6s6sH', mac_to_bytes(destination_mac), mac_to_bytes(source_mac), ethertype)

        file_size = os.path.getsize(file_path)
        print(f"Sending ONNX file: {file_path} ({file_size} bytes)")

        with open(file_path, "rb") as f:
            chunk_id = 0
            while True:
                chunk = f.read(chunk_size)
                if not chunk:
                    break  # End of file
                
                frame = ethernet_header + struct.pack("!I", chunk_id) + chunk
                s.send(frame)
                print(f"Sent chunk {chunk_id}, Size: {len(chunk)}")
                chunk_id += 1
                time.sleep(0.01)  # Small delay to prevent packet loss

        # Send EOF marker
        eof_marker = ethernet_header + struct.pack("!I", 0xFFFFFFFF) + b"EOF"
        s.send(eof_marker)
        print("Sent EOF marker.")

        s.close()
    except socket.error as e:
        print(f"Socket error during send: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"Error during send: {e}")
        sys.exit(1)

# Receive ONNX file over Ethernet
def receive_onnx_file(interface, ethertype_filter, output_file):
    try:
        s = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype_filter))
        s.bind((interface, 0))

        print(f"Listening for ONNX file on {interface}...")

        received_chunks = {}
        while True:
            try:
                raw_frame, addr = s.recvfrom(65536)
                ethernet_header = raw_frame[:14]
                payload = raw_frame[14:]

                # Read sequence number
                chunk_id = struct.unpack("!I", payload[:4])[0]
                chunk_data = payload[4:]

                if chunk_id == 0xFFFFFFFF:  # EOF marker
                    print("Received EOF marker. Reassembling file...")

                    with open(output_file, "wb") as f:
                        for i in sorted(received_chunks.keys()):
                            f.write(received_chunks[i])
                    
                    print(f"ONNX file saved as {output_file}.")
                    break

                received_chunks[chunk_id] = chunk_data
                print(f"Received chunk {chunk_id}, Size: {len(chunk_data)}")
            except Exception as e:
                print(f"Error receiving packet: {e}")

        s.close()
    except socket.error as e:
        print(f"Socket error during receive: {e}")
        sys.exit(1)

# Main script
if __name__ == "__main__":
    INTERFACE = "enp2s0"  # Change to your interface
    DESTINATION_MAC = "00:0a:35:05:76:a0"  # FPGA MAC
    SOURCE_MAC = "9c:b6:54:0e:a5:ac"  # Host MAC
    ETHERTYPE = 0x88B5  # Custom Ethertype for ONNX file transfer

    option = input("Enter 'send' to send ONNX file or 'receive' to listen: ").strip().lower()

    if option == "send":
        file_path = input("Enter the ONNX file path to send: ").strip()
        send_onnx_file(INTERFACE, DESTINATION_MAC, SOURCE_MAC, ETHERTYPE, file_path)
    elif option == "receive":
        output_file = input("Enter the output file name for the received ONNX: ").strip()
        receive_onnx_file(INTERFACE, ETHERTYPE, output_file)
    else:
        print("Invalid option. Enter 'send' or 'receive'.")

