import socket
import os
s=socket.socket()
#host=socket.gethostname() #server hostname
host='127.0.0.1'
port=12000 #same as server
s.connect((host,port))
fileToSend = open("ToSend.txt","r")
content = fileToSend.read()
s.send(content.encode())
