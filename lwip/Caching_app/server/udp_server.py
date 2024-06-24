import socket

SERVER_IP = '10.107.90.20'
SERVER_PORT = 55555
MESSAGE = 'hello'
def start_server():
    # Create a socket object
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_socket.bind((SERVER_IP,SERVER_PORT))

    print "Server listening on {}:{}".format(SERVER_IP, SERVER_PORT)

    client_data, client_address = server_socket.recvfrom(1024)
    print "data:{} bytes".format(len(client_data))
    server_socket.sendto(MESSAGE.encode(),client_address)

    while True:
        client_data, client_address = server_socket.recvfrom(1024)
        print "{} bytes".format(len(client_data))
       

start_server()
