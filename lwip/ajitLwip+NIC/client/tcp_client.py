import socket

def tcp_client(host, port, message):
    # Create a socket object
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    try:
        # Connect to the server
        client_socket.connect((host, port))
        print "Connected to {}:{}".format(host, port)
        
        # Send data
        client_socket.sendall(message.encode())
        print "Sent: {}".format(message)
        # Receive response
        response = client_socket.recv(1024)
        print "Received: {}".format(response.decode())
   
	# Send data
	client_socket.sendall(message1.encode())
        print "Sent: {}".format(message1)
        # Receive response
        response = client_socket.recv(1024)
        print "Received: {}".format(response.decode())
        
    except Exception as e:
        print "An error occurred: {}".format(e)
    
    finally:
        # Close the connection
        client_socket.close()
        print "Connection closed"

# Usage
host = '10.107.90.23'  # Server IP address
port = 7        # Server port
message = 'Hello, Server!'

message1 = 'Siddhant this side'
print "Connecting"
tcp_client(host, port, message)
print "Connected"
