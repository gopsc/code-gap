# TxL.py
# python3

import socket
import math
import time
import threading
import sys
from queue import Queue


class aThread(threading.Thread):
    def __init__(self,threadID,name,counter,q):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = counter
        self.q = q
    def run(self):
        if self.counter == 0 :
            i(self.q)

        if self.counter == 1 :
            seed(self.threadID,self.q)

        if self.counter == 2 :
            Connect(self.threadID,self.q)

        if self.counter == 3:
            loading()
        
        if self.counter == 4:
            buff()
            
        if self.counter == 5:
            listen()
        
def newThread(ID):
    global point_connect
#输入的ID是不是新的
    if ID != len(point_connect):
        th[ID].join()
        th[ID] = aThread(ID , 'connect:' + str(ID) , 2 , Q[ID])
        point_connect[ID] = ['等待','']
    else:
        Q.append(Queue())
        th.append(aThread(ID , 'connect:' + str(ID) , 2 , Q[ID]))
        point_connect.append(['等待',''])
    th[ID].start()


def new_connect():
    global point_connect,th
    # 连接到来，开一个空接口
    L = len(point_connect) - 1  ;  i = 1
    while i <= L:
        if point_connect[i][0] == '断开':
            th[i].join()
            newThread(i)
            i = L
        else:
            if i == L:
                newThread(i+1)
        i += 1



def buff():
    global Me
# 测试
# 测试音频
    while True:
        try:
            import pyaudio
            pa = pyaudio.PyAudio()
            stream = pa.open(format=pyaudio.paInt16, channels=1, rate=44100, input=True, frames_per_buffer=4000)
            if stream.is_active() == False:
                    stream.read(4000)
        except:
            Audio = 'NO A'
        else:
            Audio = 'AUDIO'
# 清理
        try:
            pa.close()
            stream.close()
        except:
            pass
# 测试视频
        try:
            import pygame
        except:
            Vidio = 'NO V'
        else:
            Vidio = 'VIDIO'
# 测试连接
        Net = 'NOPE'
        if point_server == True:
            if point_connect[0][0] == '断开':
                Net = 'SERVER'
        if point_connect[0][0] != '断开':
            if Net == 'SERVER':
                Net += ' & CONNECT'
            else:
                Net = 'CONNECT'

# 总结
        Me = [Audio,Vidio,Net]
        time.sleep(1)












def i(q):
    global host,port,Me
    global point_server
    while True:
        keyIn = input('>>')
       
        if keyIn == ' ':
            print('Me:    ',Me[0][0], ',', Me[0][1],',', Me[0][2], '\n\n\n',Me[1])

        elif keyIn == 'connect':
            host = input('host:')
            try:
                port = int(input('port:'))
            except:
                print('port format wrong')
                host = ''

        else:
            if point_connect[0][0] != '断开':
                q.put(keyIn)





def wrong(s,wrong_msg,ID):
    global point_hands
# 异常处理
    print(ID , ':' , wrong_msg )
    s.close()
    point_connect[ID] = ['断开','']

    if point_hands == ID:
        point_hands = -1
# 如果是敲门进程，需要重新配置
    if ID == 0:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(1)
    return s





def send_add_wrong(s,msg,ID):
    try:
        s.send(msg.encode('utf-8'))
    except socket.timeout:
        s = wrong(s,msgIn+'time out ,send false!',ID)
        out = ''
    except:
        print(ID,':send false')
        s = wrong(s,sys.exc_info()[0],ID)
        out = ''
    else:
        point_wrong = 0

    return s




def recv_with_wrong(s,ID,size):
    try:
        out = s.recv(size)
        out = out.decode('utf-8')
    except:
        s = wrong(s,'recive Failled.',ID)
    return (s,out)





def seed(ID,q):
    global host,port,Me
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(1)

    while True:
        if point_connect[ID][0] == '断开':
            while host == '' or port == 0:
                time.sleep(1)
            try:
                s.connect((host, port))
            except:
                pass    
            else:
                that = recv_with_wrong(s,ID,256)
                s = that[0] ; out = that[1]
                print(':', out)
                if out == 'welcome':
                    point_connect[ID][0] = '连接'
        elif point_connect[ID][0] != '断开':
            try:
                that = recv_with_wrong(s,ID,10240)
                s = that[0] ; out = that[1]
                if q.empty() == False: 
                    msg = q.get()
                wanna = msg_contro(ID,out,msg) 
                send_with_wrong(wanna,ID)
            except:
                sleep(0)


def Connect(ID,q):
    global point_hands
    global point_audio
    global point_connect
    global th,Q

    while point_connect[ID][0] == '等待':
        clientsocket, addr = s.accept()
        clientsocket.settimeout(1)
        point_connect[ID] = ['连接', addr]
        print(ID, 'Connect by', addr)

        out = 'welcome'
        send_with_wrong(clientsocket,out,ID)
        new_connect()
        while point_connect[ID][0] == '连接':
            if q.empty() == False:
                msgIn = q.get()
            else:
                msgIn = ''
            msg = msg_contro(ID,out,msgIn)
            send_with_wrong(clientsocket,msg,ID)
            that = recv_with_wrong(clientsocket,ID,10240)
            out = that[1]
            time.sleep(0.1)

      



def msg_control(ID,out,msg):
    global point_connect

    if ID == 0:
        if point_connect[0][0] == 'HANDS':

            if out[0:6] == 'Crows:':
                        point_connect[ID][1] = out[6:]
                        #############

                        if msg == 'crow':
                            point_connect[ID] = [host,'']
                        else:
                            if msg == '':
                                msg = 'recv'
                        what = 0

                    else:
                        print(out)
                        what += 1
                        if what == 5:
                            wrong(s,'?',ID)
                        else:
                            if msg != '':
                                q.put(msg)
                                msg = ''
                    s = send_add_wrong(s,msg)






#普通权限
                else:
                    if point_connect[ID][0] == host:

                        if out == '?':
 
                            if msg == 'hands':
                                point_connect[ID][0] = 'HANDS?'
                                what = 0

                        elif out == 'audio':
                            if Me[0] == 'YEAH':
                                global point_audio ; point_audio = True
                                thread_audio = aThread(ID,'Audio',4)
                                thread_audio.start()
                                if msg != '':
                                    try:
                                        q.put(msg)
                                    except:
                                        pass
                                    msg = 'Audio is ready'
                        else:
                            print(out)
                            what += 1
                            if what == 5:
                                wrong(s,'?',ID)
                                if msg != '':
                                    q.put(msgIn)







#hands请求权限
                elif point_connect[ID][0] == 'HANDS?':
                    if out == 'hands':
                        print('Hands')
                        point_connect[ID][0] = 'HANDS'
                        msgIn = ''
                    else:
                        print('?',out)
                        point_connect[ID][0] = host
                    #
                    if msgIn != '':
                        q.put(msgIn)



####################################################################################
  

            else:
                if point_connect[ID][0] == addr:
                    if point_connect[ID][1] == 'hands':
                        msg = 'Crows:Name:crow'+'\nNet:'+'\n\nDevice'+'\nOut Device:'
                    else:
                        msg = '?'





          if point_connect[ID][1] == 'hands':
                    if point_hands != -1:
                        Return = ''
        # 调度hands
                        point_hands = out.find(' ')
            # 调度hands标志分隔符空格
                        if point_hands != -1:
                            num_hands = out[0:point_hands]
                            out_hands = out[point_hands+1:]
                            try:
                                num_hands = int(num_hands)
                                print('hands:', num_hands, ',', out_hands)
                                if num_hands != ID:
                                    if num_hands < len(point_connect):
                                        buff_connect = point_connect[num_hands][0]
                                        if (buff_connect != '等待') and (buff_connect != '断开'):
                                            if Q[num_hands].empty() == True:
                # 确认调度消息
                                                while Return != '':
                                                    time.sleep(0.05)
                                                    if Q[num_hands].empty() == True:
                                                        Q[num_hands].put(out_hands)
                                                        Return = 'it is going'
                                            else:
                                                Return = str(num_hands) + ':recive is failled'
                                        else:
                                            Return = str(num_hands) + ' is not connectted'
                                    else:
                                        Return = str(num_hands) + ' :no this connect'
                                else:
                                    Return = str(num_hands) + ':……to yourself?'
                            except:
                                Return = 'wrong aim ID'
        # 基本hands
                        else:
                            if out == 'crow':
                                if point_connect[0][0] != '断开':
                                    Q[0].put('crow')
                                print(ID,' crow')
                                point_connect[ID][1] = ''
                                point_hands = -1

                            elif out == '':
                                wrong(clientsocket, 'out', ID)
                            else:
                                if out != 'recv':
                                    what += 1
                                    if what == 10:
                                        wrong(clientsocket, out + '?', ID)
                                else:
                                    what = 0
        # 整理回应
                        while Return != '':
                                if q.empty() == True:
                                    q.put(Return)
                                    Return = ''
# BUG
                else:
    # 基本连接命令
                    Return = ''
                    if out == 'hands':
                        if point_hands != -1:
                            Return = 'hands full,hands:' + str(ID)

                        else:
                            if point_connect[0][0] != '断开':
                                Q[0].put('hands')
                            point_connect[ID][1] = 'hands' ; point_hands = ID
                            print(ID , 'hands')
                            Return = 'hands'

                    elif out == '':
                        what += 1
                        if what == 10:
                            wrong(clientsocket, 'wrong send',ID)

                    else:
                        if out[0:7] == 'Client:':
                            out = out[7:]
                            point_connect[ID][1] = out

                    if Return != '':
                            if q.empty() == True:
                                q.put(Return)
                                Return = ''










def listen():
    import pyaudio
    import np
            
    global point_audio , res_audio
            
    pa = pyaudio.PyAudio()
    stream = pa.open(format=pyaudio.paInt16, 
                                  channels=1, 
                                  rate=44100, 
                                  input=True,
                                  frames_per_buffer=4000)
    while True:
        if point_audio == False:
            if stream.is_active() == False:
                stream.stop_stream()
        else:
            if stream.is_active() == False:
                stream.start_stream()
            
            string_audio_data = stream.read(4000)
            res_audio = str(np.fromstring(string_audio_data, dtype=np.short))

def loading():
    global sinAOcos
    global point_loading

    w = 0;t = 0
    while w <= 1000:
        sinAOcos.append([])
        t = 0
        while t <= 4000:
            sinAOcos[int(w)].append([])
            sinAOcos[int(w)][int(t)].append(math.sin(t * w * 44100))
            t += 1
        w += 1
    point_loading = True


def dft(fCtD, w0, max_w, dirta_w):
    global sinAOcos
    res_dft = []
    max_t = len(fCtD) ; w = w0
    dirta_t = 100

    while w <= max_w:
        t = 0
        n = 0 ; ni = 0
        #num_w = int(w / dirta_w)

        while t < max_t:
            #num_t = int(t / dirta_t)
            n += int(fCtD[t] * math.cos(t * w * 44100))
            ni += int(fCtD[t] * math.sin(t * w * 44100))
            t += dirta_t

        mo = round((n ** 2 + ni ** 2) ** 0.5 / (max_t / 2 * dirta_t))
        res_w = mo ; w += dirta_w
        res_dft.append(res_w)

    return res_dft


global Me
global th
global Q

global host, port

global point_loading
global point_connect
global point_server
global point_hands
global point_audio

global sinAOcos

global res_dft
global res_audio


Me = ['','','']

point_audio = False
Q = []
th = []

host = '' ; port = 0
point_connect = []
point_hands = -1
point_loading = False
point_server = False
point_audio = False

sinAOcos = []
res_dft = []
res_audio = []


point_connect.append(['断开', ''])
Q.append(Queue())

me = aThread(-2 , 'Me' , 4 , Q[0])
me.start()

keyin = aThread(-1 , 'keyin' , 0 , Q[0])
keyin.start()

th.append(aThread(0, 'client', 1, Q[0]))
th[0].start()



while point_server == False:
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.bind(('192.168.124.6', 5200))
        s.listen(5)
    except:
        time.sleep(1)
    else:
        point_server = True
        newThread(1)

