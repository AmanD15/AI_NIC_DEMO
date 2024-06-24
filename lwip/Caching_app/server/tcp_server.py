import socket

SERVER_IP = '10.107.90.20'
SERVER_PORT = 55555

def start_server():
    # Create a socket object
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((SERVER_IP,SERVER_PORT))
    server_socket.listen(5)
    print "Server listening on {}:{}".format(SERVER_IP, SERVER_PORT)
    size = 0
    while True:
        # Connect to the server
        client_socket, client_address = server_socket.accept()
        print "Connected from {}".format(client_address)
        try:
		while True:
			data = client_socket.recv(1200)
			size += len(data)
			print "data receieved"
			if not data:
				break
			print "data receieved:".format(data)
			

	finally:
		# Close the connection
		print "data receieved:{} total bytes".format(size)
		client_socket.close()
		print "Connection closed"

start_server()
