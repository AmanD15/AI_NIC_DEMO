import socket
import os
import time
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
   	###############################################################

	
	offset =0
	size = 0
	j =0
	total = 0.0000000
        for i in range(1, num_images+1):

            # go to data state
            client_socket.sendall(message1.encode())
            print "Sent: {}".format(message1)
            # Receive response
            response = client_socket.recv(1024)
            print "Received: {}".format(response.decode())	
	    j = (j+1)%5
	    file_name = "abc.jpg"
            if os.path.isfile(file_name):
               
                # Open the file in binary mode
                with open(file_name, 'rb') as f:
                    # Read the file content
                    file_data = f.read()
		    # sent offset and data size
		    
                    size = len(file_data)
		    
		    message = str(offset)+","+str(size)
		    client_socket.sendall(message.encode())
  		    #print "Sent: {}".format(message)
		    response = client_socket.recv(1024)
                    #print "Received: {}".format(response.decode())

		    offset = offset + size 
                    # Send the file content
		    start = time.time() 
                    client_socket.sendall(file_data)
		    end = time.time() 
		    total = total + (end - start)
		    response = client_socket.recv(1024)
                    #print "Received: {}".format(response.decode())
	 
            else:
                print "{} not sent successfully.".format(file_name)



	 
            client_socket.sendall(message2.encode())
            print "Sent: {}".format(message2)
            # Receive response
            response = client_socket.recv(1024)
            print "Received: {}".format(response.decode())

            client_socket.sendall(message3.encode())
            print "Sent: {}".format(message3)
            # Receive response
            response = client_socket.recv(1024)
            print "Received: {}".format(response.decode())

        
    except Exception as e:
        print "An error occurred: {}".format(e)
    
    finally:
        # Close the connection
	print "total_time :{}".format(total)
        client_socket.close()
        print "Connection closed"

# Usage
host = '10.107.90.23'  # Server IP address
port = 12345        # Server port
message = 'start'
message1 = 'D'
message2 = 'C'
message3 = '10.107.90.20'+' '+'55555'
num_images = 1


tcp_client(host, port, message)


