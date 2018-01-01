import socket;import threading;import os;import time
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = '192.168.124.6' ; port = 5200; out = ''
while True:
    out = ''
    try:
        connect = False
        s.connect((host,port))
        out = s.recv(1024)
        out = out.decode('utf-8')
        print(out)
    except:
        connect = False
    else:
        if out == 'welcome':
            connect = True        
    while connect:
        try:
            out = ''
            out = s.recv(1024)
            out = out.decode('utf-8')
            print(out)
        except:
            print('!')
            s.close()
            connect = False
        if out != '':
            if out == 'return':
                fw = open('/home/pi/Crow.py','w')
                fseed = open('/home/pi/seed.py','r')
                msg = fseed.readlines()
                fw.writelines(msg)
                fw.close()
                fseed.close()
                msg = 'Done'
                s.send(msg.encode('utf-8'))
            elif out[0:4] == 'cmd ':
                s.send('done'.encode('utf-8'))
                os.system(out[4:])
            elif out == '?':
                s.send('!'.encode('utf-8'))
            elif out == 'read':
                fr = open('/home/pi/Crow.py','r')
                msg = fr.readlines()
                msg = msg[72:]
                msg = '$'.join(msg)
                fr.close()
                s.send(msg.encode('utf-8'))
            elif out == 'write':
                fw = open('/home/pi/Crow.py','w')
                fseed = open('/home/pi/seed.py','r')
                msg = fseed.readlines()
                fw.writelines(msg)
                fw.close()
                fw = open('/home/pi/Crow.py','a')
                time.sleep(1)
                msg = s.recv(102400)
                msg = msg.decode('utf-8')
                msg = msg.split('$')
                fw.writelines(msg)
                fw.close()
                fseed.close()
                msg = 'Done'
                s.send(msg.encode('utf-8'))
            elif out == 'seed':
                fseed = open('/home/pi/seed.py','r')
                msg = fseed.readlines()
                msg = '$'.join(msg)
                fseed.close()
                s.send(msg.encode('utf-8'))
#3 * 4 ''            
