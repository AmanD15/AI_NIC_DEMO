import socket
import struct
import time

def mac_to_bytes(mac_address):
    return struct.pack('!6B', *[int(x, 16) for x in mac_address.split(':')])

def build_ethernet_frame(dest_mac, src_mac, ethertype, payload):
    ethernet_header = struct.pack('!6s6sH', mac_to_bytes(dest_mac), mac_to_bytes(src_mac), ethertype)
    return ethernet_header + payload

class PacketManager:
    def __init__(self, interface, dest_mac, src_mac, ethertype, payload, total_packets, burst_size):
        self.interface = interface
        self.dest_mac = dest_mac
        self.src_mac = src_mac
        self.ethertype = ethertype
        self.payload = payload
        self.total_packets = total_packets
        self.burst_size = burst_size

        self.packets_sent = 0
        self.packets_received = 0
        #self.packets_received = burst_size  # Include initial burst in receive count

        # Prebuild the frame once
        self.frame = build_ethernet_frame(dest_mac, src_mac, ethertype, payload)

        # Raw sockets
        self.send_socket = socket.socket(socket.AF_PACKET, socket.SOCK_RAW)
        self.send_socket.bind((interface, 0))

        self.recv_socket = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ethertype))
        self.recv_socket.bind((interface, 0))
        self.recv_socket.settimeout(1.0)

    def send_burst_packets(self):
        for _ in range(self.burst_size):
            self.send_socket.send(self.frame)
            self.packets_sent += 1

    def send_packet(self):
        self.send_socket.send(self.frame)
        self.packets_sent += 1

    def receive_packet(self):
        try:
            raw_frame, _ = self.recv_socket.recvfrom(65536)
            ethertype = struct.unpack('!H', raw_frame[12:14])[0]
            if ethertype == self.ethertype:
                self.packets_received += 1
                return True
        except socket.timeout:
            pass
        return False

    def run(self):
        start_time = time.perf_counter()

        self.send_burst_packets()

        while self.packets_sent < self.total_packets:
            if self.receive_packet():
                self.send_packet()

        end_time = time.perf_counter()
        total_time = end_time - start_time

        total_bytes_sent = len(self.frame) * self.packets_sent
        total_bytes_received = len(self.frame) * self.packets_received

        send_throughput_bps = total_bytes_sent / total_time
        receive_throughput_bps = total_bytes_received / total_time

        send_throughput_mbps = (send_throughput_bps / 1_048_576) * 8
        receive_throughput_mbps = (receive_throughput_bps / 1_048_576) * 8

        print(f"Completed sending {self.packets_sent} packets.")
        print(f"Total time taken: {total_time:.4f} seconds")
        print(f"Send Throughput: {send_throughput_bps:.2f} bytes/sec ({send_throughput_mbps:.2f} Mbps)")
        #print(f"Receive Throughput: {receive_throughput_bps:.2f} bytes/sec ({receive_throughput_mbps:.2f} Mbps)")

        self.send_socket.close()
        self.recv_socket.close()

if __name__ == "__main__":
    try:
        user_input = input("Enter total_packets, burst_size, payload_length (separated by spaces): ").strip()
        total_packets, burst_size, payload_length = map(int, user_input.split())

        if payload_length > (1500 - 14):
            print("Payload length exceeds standard Ethernet MTU. Max allowed: 1486 bytes.")
            exit(1)

        payload = b'A' * payload_length

        manager = PacketManager(
            interface="enp2s0",  # Change to your interface
            dest_mac="00:0a:35:03:1e:50",
            src_mac="9c:b6:54:0e:a5:ac",
            ethertype=0x88B5,
            payload=payload,
            total_packets=total_packets,
            burst_size=burst_size
        )

        manager.run()

    except KeyboardInterrupt:
        print("\nProcess interrupted.")
    except Exception as e:
        print(f"Error: {e}")

