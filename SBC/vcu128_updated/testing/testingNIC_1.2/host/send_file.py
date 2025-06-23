import socket
import struct
import time
import os

def mac_to_bytes(mac_address):
    return struct.pack('!6B', *[int(x, 16) for x in mac_address.split(':')])

def build_ethernet_frame(dest_mac, src_mac, ethertype, payload):
    ethernet_header = struct.pack('!6s6sH', mac_to_bytes(dest_mac), mac_to_bytes(src_mac), ethertype)
    return ethernet_header + payload

class FilePacketManager:
    def __init__(self, interface, dest_mac, src_mac, ethertype, send_file, receive_file, burst_size):
        self.interface = interface
        self.dest_mac = dest_mac
        self.src_mac = src_mac
        self.ethertype = ethertype
        self.send_file = send_file
        self.receive_file = receive_file
        self.burst_size = burst_size

        self.payload_size = 1500 - 14 - 4  # Ethernet MTU - header - 4-byte seq num
        self.sent_frames = []
        self.received_chunks = {}

        self.packets_sent = 0
        self.packets_received = 0

        self.prepare_file_chunks()

        # Raw sockets
        self.send_socket = socket.socket(socket.AF_PACKET, socket.SOCK_RAW)
        self.send_socket.bind((interface, 0))

        self.recv_socket = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype))
        self.recv_socket.bind((interface, 0))
        self.recv_socket.settimeout(1.0)

    def prepare_file_chunks(self):
        with open(self.send_file, 'rb') as f:
            data = f.read()

        self.total_packets = (len(data) + self.payload_size - 1) // self.payload_size

        for i in range(self.total_packets):
            chunk = data[i*self.payload_size:(i+1)*self.payload_size]
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
        print(f"Starting file transfer: {self.total_packets} packets")

        t1 = time.perf_counter()

        # Step 1: Burst send
        self.send_burst_packets()

        t2 = time.perf_counter()

        # Step 2: For each receive, send next
        while self.packets_sent < self.total_packets:
            if self.receive_packet():
                self.send_packet()

        t3 = time.perf_counter()

        # Step 3: Finish receiving all packets
        timeout_count = 0
        max_timeouts = 10
        while self.packets_received < self.total_packets and timeout_count < max_timeouts:
            if not self.receive_packet():
                timeout_count += 1

        t4 = time.perf_counter()

        # Reassemble and write file
        with open(self.receive_file, 'wb') as f:
            for i in range(self.total_packets):
                f.write(self.received_chunks.get(i, b''))

        # Stats
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
        user_input = input("Enter send_file receive_file burst_size: ").strip()
        send_file, receive_file, burst_size = user_input.split()
        burst_size = int(burst_size)

        if not os.path.isfile(send_file):
            print(f"Error: Send file '{send_file}' does not exist.")
            exit(1)

        manager = FilePacketManager(
            interface="enp2s0",  # Change to your interface
            dest_mac="00:0a:35:05:76:a0",
            src_mac="9c:b6:54:0e:a5:ac",
            ethertype=0x88B5,
            send_file=send_file,
            receive_file=receive_file,
            burst_size=burst_size
        )
        manager.run()

    except KeyboardInterrupt:
        print("\nProcess interrupted.")
    except Exception as e:
        print(f"Error: {e}")

