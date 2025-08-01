import socket
import struct
import time
import os

# Packet types
DATA_PACKET = 0x01
SUMMARY_PACKET = 0x02
ACK_PACKET = 0x03

def mac_to_bytes(mac_address):
    return struct.pack('!6B', *[int(x, 16) for x in mac_address.split(':')])

def build_ethernet_frame(dest_mac, src_mac, ethertype, payload, packet_type):
    ethernet_header = struct.pack('!6s6sH', mac_to_bytes(dest_mac), mac_to_bytes(src_mac), ethertype)
    return ethernet_header + struct.pack('!B', packet_type) + payload

def calculate_bit_error_rate(original_file, received_file):
    with open(original_file, 'rb') as f1, open(received_file, 'rb') as f2:
        original_data = f1.read()
        received_data = f2.read()

    min_len = min(len(original_data), len(received_data))
    errors = 0

    for b1, b2 in zip(original_data[:min_len], received_data[:min_len]):
        diff = b1 ^ b2
        errors += bin(diff).count('1')

    total_bits = min_len * 8
    return errors / total_bits if total_bits > 0 else 0.0

class ImagePacketManager:
    def __init__(self, interface, dest_mac, src_mac, ethertype, send_image, receive_image, burst_size):
        self.interface = interface
        self.dest_mac = dest_mac
        self.src_mac = src_mac
        self.ethertype = ethertype
        self.send_image = send_image
        self.receive_image = receive_image
        self.burst_size = burst_size

        self.payload_size = 1481
        self.sent_frames = []
        self.received_chunks = {}

        self.packets_sent = 0
        self.packets_received = 0

        self.prepare_image_chunks()

        self.send_socket = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.ntohs(ethertype))
        self.send_socket.bind((interface, 0))

        self.recv_socket = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.ntohs(ethertype))
        self.recv_socket.bind((interface, 0))
        self.recv_socket.settimeout(1.0)

    def prepare_image_chunks(self):
        with open(self.send_image, 'rb') as f:
            data = f.read()

        self.total_packets = (len(data) + self.payload_size - 1) // self.payload_size
        self.total_payload_size = len(data)

        for i in range(self.total_packets):
            chunk = data[i * self.payload_size : (i + 1) * self.payload_size]
            header = struct.pack('!I', i)
            payload = header + chunk
            frame = build_ethernet_frame(self.dest_mac, self.src_mac, self.ethertype, payload, DATA_PACKET)

            if len(frame) > 1500:
                print(f"⚠️ Frame {i} too large: {len(frame)} bytes")

            self.sent_frames.append(frame)

    def send_burst_packets(self):
        for _ in range(self.burst_size):
            if self.packets_sent < self.total_packets:
                frame = self.sent_frames[self.packets_sent]
                #print(f"Sending frame {self.packets_sent}, size: {len(frame)}")
                self.send_socket.sendto(frame, (self.interface, 0))
                self.packets_sent += 1

    def send_packet(self):
        if self.packets_sent < self.total_packets:
            frame = self.sent_frames[self.packets_sent]
            #print(f"Sending frame {self.packets_sent}, size: {len(frame)}")
            self.send_socket.sendto(frame, (self.interface, 0))
            self.packets_sent += 1

    def receive_packet(self):
        try:
            raw_frame, _ = self.recv_socket.recvfrom(65536)
            ethertype = struct.unpack('!H', raw_frame[12:14])[0]
            if ethertype != self.ethertype:
                return None, None

            packet_type = raw_frame[14]
            payload = raw_frame[15:]

            if packet_type == DATA_PACKET:
                seq = struct.unpack('!I', payload[:4])[0]
                data = payload[4:]
                if seq not in self.received_chunks:
                    self.received_chunks[seq] = data
                    self.packets_received += 1
                return DATA_PACKET, seq

            elif packet_type == SUMMARY_PACKET:
                total_packets_received = struct.unpack('!I', payload[:4])[0]
                total_payload_size_received = struct.unpack('!I', payload[4:8])[0]

                if total_packets_received == self.total_packets and total_payload_size_received == self.total_payload_size:
                    #print(f"Summary matched: {total_packets_received} packets, {total_payload_size_received} bytes")
                    self.send_ack("OK", [])
                    return SUMMARY_PACKET, []
                else:
                    print(f"Summary mismatch! Expected {self.total_packets} packets and {self.total_payload_size} bytes.")
                    missing = [seq for seq in range(self.total_packets) if seq not in self.received_chunks]
                    self.send_ack("MI", missing)
                    return SUMMARY_PACKET, missing

            elif packet_type == ACK_PACKET:
                ack_type = payload[:2].decode()
                #print(f"Received ACK type: {ack_type}, Payload: {payload[2:]}")
                if ack_type == "OK":
                    return ACK_PACKET, []
                elif ack_type == "MI":
                    count = struct.unpack('!I', payload[2:6])[0]
                    missing = [struct.unpack('!I', payload[6 + i * 4: 10 + i * 4])[0] for i in range(count)]
                    return ACK_PACKET, missing

        except socket.timeout:
            pass
        return None, None

    def send_summary_packet(self):
        summary_payload = struct.pack('!I', self.total_packets)
        summary_payload += struct.pack('!I', self.total_payload_size)
        frame = build_ethernet_frame(self.dest_mac, self.src_mac, self.ethertype, summary_payload, SUMMARY_PACKET)
        #print(f"Sending summary packet (length: {len(frame)})")
        self.send_socket.sendto(frame, (self.interface, 0))

    def send_ack(self, ack_type, missing_list):
        if ack_type == "OK":
            payload = b'OK'
        else:
            payload = b'MI' + struct.pack('!I', len(missing_list))
            for seq in missing_list:
                payload += struct.pack('!I', seq)
        frame = build_ethernet_frame(self.dest_mac, self.src_mac, self.ethertype, payload, ACK_PACKET)
        #print(f"Sending ACK packet (length: {len(frame)})")
        self.send_socket.sendto(frame, (self.interface, 0))

    def run(self):
        #print(f"\nSending image '{self.send_image}' as {self.total_packets} packets...")

        t1 = time.perf_counter()
        self.send_burst_packets()
        t2 = time.perf_counter()

        last_packet_time = time.time()
        timeout_threshold = 10

        while self.packets_sent < self.total_packets:
            pkt_type, _ = self.receive_packet()
            if pkt_type == DATA_PACKET:
                self.send_packet()
                last_packet_time = time.time()
            elif time.time() - last_packet_time > timeout_threshold:
                print("Receiver timed out waiting for packets.")
                self.send_socket.close()
                self.recv_socket.close()
                return 0.0, 0.0, 0, 0.0

        t3 = time.perf_counter()

        while True:
            self.send_summary_packet()

            timeout_count = 0
            max_timeouts = 20
            ack_received = False
            missing = []

            while timeout_count < max_timeouts:
                #print(f"Waiting for ACK... attempt {timeout_count + 1}")
                pkt_type, data = self.receive_packet()
                if pkt_type == ACK_PACKET:
                    ack_received = True
                    missing = data
                    break
                timeout_count += 1

            if not ack_received:
                print("No ACK received after summary. Timeout. Aborting this image.")
                self.send_socket.close()
                self.recv_socket.close()
                return 0.0, 0.0, 0, 0.0

            if not missing:
                #print("All packets acknowledged by receiver.")
                break

            print(f"Receiver reported missing packets: {missing}")
            for seq in missing:
                if 0 <= seq < len(self.sent_frames):
                    self.send_socket.sendto(self.sent_frames[seq], (self.interface, 0))

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

        ber = calculate_bit_error_rate(self.send_image, self.receive_image)
        print(f"Bit Error Rate (BER): {ber:.8f}")

        self.send_socket.close()
        self.recv_socket.close()

        return send_duration, recv_duration, total_bytes, ber

if __name__ == "__main__":
    try:
        send_image = input("Enter the image file to send: ").strip()
        if not os.path.isfile(send_image):
            print(f"Error: Image '{send_image}' not found.")
            exit(1)

        count = int(input("Enter number of times to send the image: ").strip())
        base_name = input("Enter base name for received images (without extension): ").strip()
        burst_size = int(input("Enter burst size: ").strip())

        total_send_time = 0.0
        total_recv_time = 0.0
        total_bytes = 0
        total_ber = 0.0
        send_throughputs = []
        recv_throughputs = []

        for i in range(1, count + 1):
            receive_image = f"{base_name}_{i}.jpg"
            print(f"\n--- Transmission {i} ---")

            manager = ImagePacketManager(
                interface="enp2s0",  # Replace with your actual network interface name
                dest_mac="00:0a:35:03:1e:50",  # Replace with actual destination MAC
                src_mac="9c:b6:54:0e:a5:ac",   # Replace with actual source MAC
                ethertype=0x88B5,
                send_image=send_image,
                receive_image=receive_image,
                burst_size=burst_size
            )

            send_time, recv_time, bytes_sent, ber = manager.run()
            total_send_time += send_time
            total_recv_time += recv_time
            total_bytes += bytes_sent
            total_ber += ber

            send_tp = (bytes_sent / send_time / 1_048_576) * 8 if send_time > 0 else 0
            recv_tp = (bytes_sent / recv_time / 1_048_576) * 8 if recv_time > 0 else 0
            send_throughputs.append(send_tp)
            recv_throughputs.append(recv_tp)

        if count > 0 and total_send_time > 0 and total_recv_time > 0:
            avg_send_throughput = (total_bytes / total_send_time / 1_048_576) * 8
            avg_recv_throughput = (total_bytes / total_recv_time / 1_048_576) * 8
            avg_ber = total_ber / count

            max_send_throughput = max(send_throughputs)
            max_recv_throughput = max(recv_throughputs)

            print(f"\n=== Overall Averages for {count} Images ===")
            print(f"Average Send Throughput: {avg_send_throughput:.2f} Mbps")
            print(f"Average Receive Throughput: {avg_recv_throughput:.2f} Mbps")
            print(f"Average Bit Error Rate (BER): {avg_ber:.8f}")
            print(f"Maximum Send Throughput: {max_send_throughput:.2f} Mbps")
            print(f"Maximum Receive Throughput: {max_recv_throughput:.2f} Mbps")

    except KeyboardInterrupt:
        print("\nProcess interrupted.")
    except Exception as e:
        print(f"Error: {e}")

