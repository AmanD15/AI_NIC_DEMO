import socket
import time
SERVER_IP = '10.107.90.20'
SERVER_PORT = 55555
MESSAGE = 'hello'
def start_server():
    # Create a socket object
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_socket.bind((SERVER_IP,SERVER_PORT))

    print "Server listening on {}:{}".format(SERVER_IP, SERVER_PORT)

    client_data, client_address = server_socket.recvfrom(1024)
    #print "data:{} bytes".format(len(client_data))
    server_socket.sendto(MESSAGE.encode(),client_address)
    total = 0.0000000
    while True:
	start = time.time() 
        client_data, client_address = server_socket.recvfrom(1024)
	end = time.time()
	total = total + (end - start)
	if(len(client_data) == 3):
	    print "total = {}".format(total)
       
       

start_server()
print "total = {}".format(total)
