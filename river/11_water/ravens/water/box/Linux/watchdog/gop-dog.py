#!/usr/bin/python
import os, time
 

while True:
    if '192' not in os.popen('ifconfig | grep 192').read():
        print '\n****** wifi is down, restart... ******\n'
        os.system('sudo /etc/init.d/networking restart')

    if '/etc/init.d/gopi' not in  os.popen('ps -aux | grep gopi').read():
        print '\n****** wifi is down, restart... ******\n'
        os.system('sudo /etc/init.d/gopi restart')

    time.sleep(5*60)


