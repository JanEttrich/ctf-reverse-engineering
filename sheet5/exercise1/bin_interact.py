#!/usr/bin/python3

import socket
import telnetlib


# start connection
s = socket.create_connection(('localhost', 2000))

t = telnetlib.Telnet()
t.sock = s
t.interact()

s.close()

