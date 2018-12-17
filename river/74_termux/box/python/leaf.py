import socket
import os
import time

host = '192.168.16.102' 
port = 5200
out  = ''


while True:
    out = ''
   
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((host,port))
        out = s.recv(2048)
    except:
        pass
    else:
     
      
        msg = 'Who is that?'
        
        if out.find('This is gop station.') == 0:

            if out.find("Who is that") == 21: 
                msg  = 'This is a leaf.'
                msg += '\n'
                
                msg += '------------'
                msg += '\n'

                msg += (os.popen('uname -n').read())[:-1]
                msg += ',python'
                msg += '\n'
                
                msg += 'TIME:'
                msg += str(time.time())
                msg += '\n'
                
                msg += '------------'
                msg += '\n'
                msg += '\n'
        s.send(msg)
        s.close()
        time.sleep(0.1)
