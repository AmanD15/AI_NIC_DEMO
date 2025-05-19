import socket
import struct
import time
import os

def mac_to_bytes(mac_address):
    return struct.pack('!6B', *[int(x, 16) for x in mac_address.split(':')])

def build_ethernet_frame(dest_mac, src_mac, ethertype, payload):
    ethernet_header = struct.pack('!6s6sH', mac_to_bytes(dest_mac), mac_to_bytes(src_mac), ethertype)
    return ethernet_header + payload

class ImagePacketManager:
    def __init__(self, interface, dest_mac, src_mac, ethertype, send_image, receive_image, burst_size):
        self.interface = interface
        self.dest_mac = dest_mac
        self.src_mac = src_mac
        self.ethertype = ethertype
        self.send_image = send_image
        self.receive_image = receive_image
        self.burst_size = burst_size

        self.payload_size = 1500 - 14 - 4  # Ethernet MTU - Ethernet header - 4-byte seq number
        self.sent_frames = []
        self.received_chunks = {}

        self.packets_sent = 0
        self.packets_received = 0

        self.prepare_image_chunks()

        # Sockets
        self.send_socket = socket.socket(socket.AF_PACKET, socket.SOCK_RAW)
        self.send_socket.bind((interface, 0))

        self.recv_socket = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype))
        self.recv_socket.bind((interface, 0))
        self.recv_socket.settimeout(1.0)

    def prepare_image_chunks(self):
        with open(self.send_image, 'rb') as f:
            data = f.read()

        self.total_packets = (len(data) + self.payload_size - 1) // self.payload_size

        for i in range(self.total_packets):
            chunk = data[i * self.payload_size : (i + 1) * self.payload_size]
            header = struct.pack('!I', i)  # 4-byte sequence number
            frame = build_ethernet_frame(self.dest_mac, self.src_mac, self.ethertype, header + chunk)
            self.sent_frames.append(frame)

    def send_burst_packets(self):
        for _ in range(self.burst_size):
            if self.packets_sent < self.total_packets:
                self.send_socket.send(self.sent_frames[self.packets_sent])
                self.packets_sent += 1

    def send_packet(self):
        if self.packets_sent < self.total_packets:
            self.send_socket.send(self.sent_frames[self.packets_sent])
            self.packets_sent += 1

    def receive_packet(self):
        try:
            raw_frame, _ = self.recv_socket.recvfrom(65536)
            ethertype = struct.unpack('!H', raw_frame[12:14])[0]
            if ethertype != self.ethertype:
                return False

            payload = raw_frame[14:]
            seq = struct.unpack('!I', payload[:4])[0]
            data = payload[4:]
            if seq not in self.received_chunks:
                self.received_chunks[seq] = data
                self.packets_received += 1
                return True
        except socket.timeout:
            pass
        return False

    def run(self):
        print(f"\nSending image '{self.send_image}' as {self.total_packets} packets...")

        t1 = time.perf_counter()
        self.send_burst_packets()
        t2 = time.perf_counter()

        while self.packets_sent < self.total_packets:
            if self.receive_packet():
                self.send_packet()

        t3 = time.perf_counter()

        timeout_count = 0
        max_timeouts = 10
        while self.packets_received < self.total_packets and timeout_count < max_timeouts:
            if not self.receive_packet():
                timeout_count += 1

        t4 = time.perf_counter()

        with open(self.receive_image, 'wb') as f:
            for i in range(self.total_packets):
                f.write(self.received_chunks.get(i, b''))

        total_bytes = sum(len(data) for data in self.received_chunks.values())
        send_duration = t3 - t1
        recv_duration = t4 - t2
        send_throughput_mbps = (total_bytes / send_duration / 1_048_576) * 8 if send_duration > 0 else 0
        recv_throughput_mbps = (total_bytes / recv_duration / 1_048_576) * 8 if recv_duration > 0 else 0

        print(f"Completed sending {self.packets_sent} packets.")
        print(f"Received {self.packets_received} packets.")
        print(f"Send Time: {send_duration:.4f} seconds")
        print(f"Receive Time: {recv_duration:.4f} seconds")
        print(f"Send Throughput: {send_throughput_mbps:.2f} Mbps")
        print(f"Receive Throughput: {recv_throughput_mbps:.2f} Mbps")

        self.send_socket.close()
        self.recv_socket.close()

if __name__ == "__main__":
    try:
        # Get user inputs
        send_image = input("Enter the image file to send: ").strip()
        if not os.path.isfile(send_image):
            print(f"Error: Image '{send_image}' not found.")
            exit(1)

        count = int(input("Enter number of times to send the image: ").strip())
        base_name = input("Enter base name for received images (without extension): ").strip()
        burst_size = int(input("Enter burst size: ").strip())

        for i in range(1, count + 1):
            receive_image = f"{base_name}_{i}.jpg"
            print(f"\n--- Transmission {i} ---")

            manager = ImagePacketManager(
                interface="enp2s0",  # Replace with your actual interface name
                dest_mac="00:0a:35:03:1e:50",
                src_mac="9c:b6:54:0e:a5:ac",
                ethertype=0x88B5,
                send_image=send_image,
                receive_image=receive_image,
                burst_size=burst_size
            )

            manager.run()

    except KeyboardInterrupt:
        print("\nProcess interrupted.")
    except Exception as e:
        print(f"Error: {e}")

