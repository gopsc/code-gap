import socket
import math
import time
import threading
import sys
import os
import queue
try:
    import tkinter
    import pyaudio
    import numpy
except:
    pass

global thread 


class aThread(threading.Thread):
 # 比较标准的python3线程类
    def __init__(self,threadID,name,counter,q):
        threading.Thread.__init__(self)
        self.threadID = threadID
        # ID用来与连接序数相对应
        self.name = name
        self.counter = counter
        self.q = q
    def run(self):
        if self.counter == 0 :
            Loading()
        if self.counter == 1 :
            info()
        if self.counter == 2 :
            i(self.q)
        if self.counter == 3:
            connect[0].Seed(self.threadID,self.q)
        if self.counter == 4:
            connect[threadID].Connect(self.threadID,self.q)
        if self.counter == 5:
            sop()
        if self.counter == 6:
            listen()
        if self.counter == 7:
            tk_update()

class aConnect:
    def __init__(self,ID):
        self.ID = ID
        self.q = queue.Queue()
        self.thread = []
        self.info = ['Wait','']


    def new_connect(self):
        global connect
        # 连接到来，开一个空接口
        L = len(connect) - 1  ;  i = 1
        while i <= L:
            if connect[i].info[0] == 'Out':
                connect[i].thread.join()
                self.newThread(i)
                i = L
            else:
                if i == L:
                    self.newThread(i+1)
            i += 1

    def newThread(self,ID):
        global connect
        if self.ID == 0:
            self.thread = aThread(0,'seed',3,self.q)
        else:
            if self.ID != len(connect):
                self.thread = aThread(self.ID,'connect',4,self.q)
            else:
                self.thread = aThread(self.ID,'connect',4,self.q)
        self.thread.start() 



    def Connect(self,ID,q):
        global Me , connect, settings
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(1)

        while True:
            
            if self.info[0] == 'Out':
                time.sleep(0.1)

                if settings[1] == Me[0][1] and settings[2] == settings[3]:
                    settings[1] = '' ; settings[2] = 0

                while settings[1] == '' or settings[2] == 0:
                    time.sleep(1)

                try:
                    s.connect((settings[1], settings[2]))
                except:
                    settings[1] == '' ; settings[2] == 0
                else:
                    that = self.recv_with_wrong(self.ID,s,128)
                    s = that[0]
                    out = that[1]
                    self.msg_control(self.ID,out,'hello')
            else:
                that = self.recv_with_wrong(self.ID,s,10240)
                s = that[0] ; out = that[1]
                if self.q.empty() == False:
                    msgIn = self.q.get()
                else:
                    msgIn = ''
                if self.info[0] != 'Out':
                    print(out,msgIn)
                    wanna = self.msg_control(self.ID, out, msgIn)
                    self.send_with_wrong(self.ID,s,wanna)

    def Seed(self,ID,q):
        global settings
        global socket_server

        while self.info[0] == 'Wait':

            if self.ID <= settings[4]:

                clientsocket, addr = socket_server.accept()
                clientsocket.settimeout(1)
                self.info[ID] = ['Connect', addr]
                print(self.ID, 'Connect by', addr)

                out = 'welcome' ; msg = ''
                self.send_with_wrong(self.ID,clientsocket,out)
                self.new_connect()

            else:
                clientsocket, addr = socket_server.accept()
                print(self.ID, 'Full by', addr)

                out = 'Sorry , full!!!' ; msg = ''
                self.send_with_wrong(self.ID,clientsocket,out)

            while self.info[0] != 'Out':

                if self.q.empty() == False:
                    msg = self.q.get()
                msg = self.msg_control(self,ID,out,msg)
                self.send_with_wrong(self.ID,clientsocket,msg) ; msg == ''

                if self.info[0] != 'Out':
                    that = self.recv_with_wrong(self.ID,clientsocket,10240)
                    out = that[1]
                time.sleep(0.9)





    def wrong(self,ID,s,wrong_msg):
        global point
        global connect
    # 异常处理
        print(self.ID , ':' , wrong_msg )
        connect[self.ID] = ['Out','']

        if point[0] == ID:
            point[0] = -1
    #敲门进程是固定位置的，如果是敲门进程，需要重新配置
        if ID == 0:
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.settimeout(1)
        if ID == point[0]:
            point[0] = -1
        return s

    def send_with_wrong(self,ID,s,msg):
        try:
            s.send(msg.encode('utf-8'))
        except:
            print(ID,':send failled')    
            s = self.wrong(ID,s,sys.exc_info()[0])
            out = ''
        return s

    def recv_with_wrong(self,ID,s,size):
        try:
            out = s.recv(size)
            out = out.decode('utf-8')
        except:
            print(ID,'recive failled.')
            s = self.wrong(ID,s, sys.exc_info()[0])
            out = ''
        return (s,out)








    def msg_control(ID,out,msg):
        global connect
        global point
        global Me
        msg_even = ''

        #我的信息
        try:
            number = 0
            change = True
            while change == True:
                change = False
                for i in connect:
                    if i.info[1].find('(' + str(number) + ')') != -1:
                        number += 1
                        change = True

            that = [] ; thisNUM = '('+str(number)+')'
            for i in connect:
                that.append(thisNUM.join(i.info))

            #Me = [hostInfo,CpuRamDisk,MediaInfo,NetInfo,windowInfo]
            thisNUM = '('+str(number)+')'
            Info_name = thisNUM.join(Me[0][0:2]) + str(Me[0][2])
            Info_connect = thisNUM.join(that)
            Info_cpu = thisNUM.join(Me[1][0])
            Info_ram = thisNUM.join(Me[1][1])
            Info_disk = thisNUM.join(Me[1][2])    
            Info_media = thisNUM.join(Me[2])
            # msg
            thisNUM = '('+str(number+1)+')'
            rater = [Info_name , Info_cpu, Info_ram, Info_disk, Info_media,Info_connect]
            rater = thisNUM.join(rater)+'msg:'+msg    
        except:
            print(sys.exc_info()[0])
            rater = '...msg:'+msg

        #处理
        if ID == 0:
            #断开状态，检查敲门是否成功
            if connect[ID].info[0] == 'Out':
                if out == 'welcome' and msg == 'hello':
                    print('welcome')    
                    connect[ID].info[0] = 'Connect'
                else:
                    msg_even = 'Who？\n'+out
            #连接状态，等待指令
            elif connect[ID].info[0] == 'Connect':
                if out == '?':
                    if msg == '':
                        pass
                    else:
                        if msg == 'hand':
                            connect[ID].info[0] = 'Hand?'
                else:
                    msg_even = out
                return rater
            #hand等待状态
            elif connect[ID].info[0] == 'Hand?':
                if out.find('msg:') != -1:
                    if out[out.find('msg:') + 4:] == 'hand':
                        msg_even = 'hand'
                        connect[ID].info[0] = 'Hand'
                        return 'recive'
                    elif out[out.find('msg:') + 4:] == 'hand...':    
                        return rater
                else:
                    msg_even = out
                    connect[ID].info[0] = 'Connect'
                    print('No hand',out)
                    return rater
            #hand状态
            elif connect[ID].info[0] == 'Hand':
                msg_num = out.find('msg:')    
                connect[ID].info[1] = out[0:msg_num]
                if msg_num != -1:
                    if msg == 'crow':
                        connect[ID].info[0] = 'Connect'
                        return msg    
                    else:
                        return 'recive'
                else:
                    connect[ID].info[0] = 'Out'
        #主机
        else:
            # 连接下端主机
            if connect[ID].info[0] == 'Connect':
                msg_num = out.find('msg:')
                if msg_num != -1:
                    msg_out = out[msg_num + 4:]
                    connect[ID].info[1] = out[0:msg_num]
                    if msg_out == 'hand':
                        # 接收到hand请求，开始商议
                        if point[0] == -1:
                            if connect[0].info[0] =='Out':
                                connect[ID].info[0] = 'Hand'
                                point[0] = ID
                                return 'msg:hand'
                            elif connect[0].info[0] == 'Connect':
                                Q[1][0].put('hand')
                                connect[0].info[0] = 'Hand'
                                connect[ID].info[0] = 'Hand?'
                                Q[1][0].put('msg:hand...')    
                            else:
                                return 'hand full    '
                        else:
                            return 'hand full'
                    else:
                        return '?'
                elif out == 'welcome':
                    return '?'
            #hand机
            elif connect[ID].info[0] == 'Hand':
                if out == 'crow':
                    connect[ID].info = ['Connect','']
                    point[0] = -1
                    return '?'
                else:
                    if out != 'recive':
                        msg_even = 'hands:'+out
                    return rater
            #hand请求机
            elif connect[ID].info[0] == 'Hand?':
                if connect[0].info[0] == 'Hand':
                    return 'msg:hand'
                elif connect[0].info[0] == 'Hand?':
                    return 'msg:hand...'
                elif connect[0].info[0] == 'Connect':
                    return '?'
        if point[0] != -1:
            while connect[point[0]].q.empty()==True:
                connect[point[0]].q.put(ID+':'+msg_even)
        print(msg_even)













#-----------------------------------------thread---------------------------------------------------------
def Loading():
    global thread , watchDogs , Me , socket_server , tk 
    global connect , point  , settings , res_audio , res_dft

    thread = []
    sinAOcos = []
    socket_server = False ; tk = False
    Me = []
    point = [-1,False,False]
    connect = []
    watchDogs = []
    #0 for hand , 1 for audio , 2 for tk
    res_audio = []
    res_dft = []
    settings = []
    getSettings()

    for i in range(4):
        watchDogs.append(queue.Queue())
    me = aThread(-4 , 'Me' , 1 , watchDogs[0])
    me.start()
    
    while len(Me) < 5:
        time.sleep(0.1)

    if settings[0].find('1') != -1:
        keyin = aThread(-3 , 'keyin' , 2 , watchDogs[1])
        keyin.start()

    if settings[0].find('2') != -1:
        audio = aThread(-2 , 'audio' , 6 , watchDogs[2])
        audio.start()
        point[1] = True

    if settings[0].find('3') != -1:
        sop = aThread(-1 , 'sop' , 5 , watchDogs[3])
        sop.start()
        point[2] = True
    
    if settings[0].find('0') != -1:

        connect.append(aConnect(0))

        while type(socket_server) != socket.socket:
            try:
                socket_server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                socket_server.bind((getIPaddress(),settings[3]))
                socket_server.listen(settings[4])
                sop = aThread(0 , 'seed' , 3 , connect[0].q)
                sop.start()
            except:
                socket_server = []
                time.sleep(1)
            else:
                connect.append(aConnect(1))
#-------------------------------------------------------------------------------
def info():
 #这个线程会总结本机状态，放到全局变量‘Me’中
    global Me , tk , settings
    while True:
        hostInfo = [socket.gethostname() , getIPaddress() , settings[3]]
        CpuRamDisk = getCpuRamDisk()
        MediaInfo = testMEDIA()
        NetInfo = net()
        try:
            windowInfo = getWindowInfo()
        except:
            windowInfo = 'No Window..'

        Me = [hostInfo,CpuRamDisk,MediaInfo,NetInfo,windowInfo]
        time.sleep(1)
#--------------------------------------------------------------------------
def i(q):
#这是一个输入线程，外部输入设备如键盘，可以从这里输入指令
    global Me , connect , settings

    while True:
        keyIn = input('>>')

        if keyIn == ' ':
            this = []
            this.append('Name:'+Me[0][0])
            this.append('ADDR:'+Me[0][1]+' PORT:'+str(settings[3])+' BIND:'+str(settings[4])+'    To:Addr'+str(settings[1])+' PORT:'+str(settings[2]) +'\n')
            this.append('CPU: Tempe..:' +Me[1][0][0]+'     Use:'+Me[1][0][1]+'%')
            this.append('RAM: total:'+Me[1][1][0] +'     Use:'+Me[1][1][1] +'     free:'+Me[1][1][2])
            this.append('DISK: total:'+Me[1][2][0]+'     Use:'+Me[1][2][1]+'     ,'+Me[1][2][2]+'\n')
            this.append('MEDIA: Audio:' + Me[2][0]+ ',Vidio:' + Me[2][1])
            this.append('NET:'+ Me[3])
            this.append('WINDOW:'+str(Me[4]))
            print('\n'.join(this))
            for this in connect:
                print(this.info)

        elif keyIn == 'connect':
            if connect[0].info[0] == 'Out':
                settings[1] = input('host:')
            try:
                settings[2] = int(input('port:'))
            except:
                print('port format wrong')
                host = ''

        else:
            if connect[0].info[0] == 'Hand' or keyIn == 'hand':
                q.put(keyIn)
#----------------------------------------------------------------------------
def listen():
#这个线程是可选项，在程序中自行加载，用于录音。 
    import pyaudio
    global res_audio , res_dft ; count=0
    pa = pyaudio.PyAudio()
    stream = pa.open(format=pyaudio.paInt16, 
                                  channels=1, 
                                  rate=44100, 
                                  input=True,
                                  frames_per_buffer=2000)
    while True:
        if stream.is_active() == False:
            stream.start_stream()
        
        audio_data = stream.read(2000)
        audio_data = numpy.fromstring(audio_data,dtype=numpy.short)
        large_sample_count = numpy.sum(audio_data>800)

        if large_sample_count>12:
            count=1
        else:
            count-=1

        if count>0:
            res_audio.append(audio_data)
        if count<0:
            count=0
            if len(res_audio)>0:
                res_dft=res_audio
                res_audio=[]
#-------------------------------------------------------------------------------
def move(event):
    global x,y,tk,flag
    flag = False
    new_x = (event.x-x[4])+tk.winfo_x()
    new_y = (event.y-y[4])+tk.winfo_y()
    s = str(x[1])+'x'+str(y[1])+'+'+str(new_x)+'+'+str(new_y)
    tk.geometry(s)
    flag = True
def button_1(event):
    global x,y,tk
    x[4],y[4] = event.x,event.y
def tk_update():
    global x,y,tk,canvas,flag
    global res_dft 

    backColor = 'green' ; fillColor = 'white' ; lines=[]

    while True:

        if res_dft!=[]:#flag == True:
            
            point=1; res =[]
            for i in range(len(res_dft)):
                for ii in range(len(res_dft[i])):
                    if point==1:
                        if res_dft[i][ii]<0:
                            res.append(i*4000+ii) ; point=-1
                    else:
                        if res_dft[i][ii]>0:
                            res.append(i*4000+ii) ; point=1


            num = round(len(res_dft)*8) ; res2=[];res2.append(0)

            for i in range(num):
                res2.append(0)
            for i in res:
                res2[round(i/500)]+=1

            len_res_dft = len(res2) ; X = x[1]*(1/(len_res_dft))
            i = 1
            

            for i in range(len(lines)):
                canvas.delete('line'+str(i)) ; lines=[]
            while i < len_res_dft:
                lines.append(canvas.create_line(((i-1)*X    ,    y[1]/2-res2[i-1]    ,    i*X     ,    y[1]/2-res2[i]) , tag='line'+str(i),fill=fillColor))
                i+=1

            canvas.pack() ; res_dft=[]
            tk.update()
            time.sleep(0.5)
        else:
            time.sleep(0.1)
def sop():
    import tkinter 
    global x,y,tk,canvas,flag
    global connect

    tk = tkinter.Tk()
    tk.overrideredirect(True) 

    x = [] ; y = [] ; flag = True
    x.append(tk.winfo_screenwidth()) ; y.append(tk.winfo_screenheight()) #W,H
    x.append(int(round(x[0]*0.618))) ; y.append(int(round(y[0]*0.382)))  #window's w,h
    x.append(x[0]/2)                 ; y.append(int(round(y[0]*0.382)))  #window's x,y(control)
    x.append(x[1])                   ; y.append(y[1]*0.382)              #title's
    x.append(0)                      ; y.append(0)                       #event

    coordNum = [x[1]*(1-0.382),x[1]*0.382]

    s = (str(x[1]) +'x'+ str(y[1]) + '+' + str(round((x[0]-x[1])/2)) + '+' + str(round(y[1]-y[2]/2)))
    tk.geometry(s)

    canvas = tkinter.Canvas(tk, bg='green', width=x[0] , height=y[0])
    canvas.configure(highlightthickness = 0)
    canvas.bind("<Button-1>",button_1)
    canvas.bind("<B1-Motion>",move)
    canvas.pack()

    tkUpdate = aThread(-6 , 'tkupdate' , 7 , 0) ; tkUpdate.start()
    tk.mainloop()
#--------------------------------linux工具箱----------------------------------------------
def get_file_adr():
    # http://www.cnblogs.com/pchgo/archive/2011/09/19/2181248.html
    # 获取脚本路径
    path = sys.path[0]
    # 判断为脚本文件还是py2exe编译后的文件，如果是脚本文件，则返回的是脚本的目录，如果是py2exe编译后的文件，则返回的是编译后的文件路径
    if os.path.isdir(path):
        return path
    elif os.path.isfile(path):
        return os.path.dirname(path)
#-------------------------------------------------------------------------------------
def getCpuRamDisk():
    # CPU informatiom
    CPU_temp = getCPUtemperature()
    CPU_usage = '?'

    CPUinfo = [CPU_temp, CPU_usage]

    # RAM information
    # Output is in kb, here I convert it in Mb for readability
    RAM_stats = getRAMinfo()
    RAM_total = str(round(int(RAM_stats[0]) / 1000, 1))
    RAM_used = str(round(int(RAM_stats[1]) / 1000, 1))
    RAM_free = str(round(int(RAM_stats[2]) / 1000, 1))

    RAMinfo = [RAM_total, RAM_used, RAM_free]

    # Disk information
    DISK_stats = getDiskSpace()
    # DISK_total = DISK_stats[0]
    # DISK_used = DISK_stats[1]
    # DISK_perc = DISK_stats[3]

    DISKinfo = [DISK_stats[0], DISK_stats[1], DISK_stats[3]]

    return [CPUinfo, RAMinfo, DISKinfo]
# Return CPU temperature as a character string
#——--------------------------------------------------------------------------------
def getCPUtemperature():
    fp = open('/sys/class/thermal/thermal_zone0/temp', 'r');
    result_c = fp.readline();
    fp.close();
    cpu_temp = int(float(result_c) / 1000.0)
    return (str(cpu_temp))
# Return % of CPU used by user as a character string
def getCPUuse():
    return (str(os.popen("top -n1 | awk '/Cpu\(s\):/ {print $2}'").readline().strip()))
# Return RAM information (unit=kb) in a list
# Index 0: total RAM
# Index 1: used RAM
# Index 2: free RAM
#-------------------------------------------------------------------------------------
def getRAMinfo():
    p = os.popen('free')
    i = 0
    while 1:
        i = i + 1
        line = p.readline()
        if i == 2:
            return (line.split()[1:4])
# Return information about disk space as a list (unit included)
# Index 0: total disk space
# Index 1: used disk space
# Index 2: remaining disk space
# Index 3: percentage of disk used
#-----------------------------------------------------------------------------------------
def getDiskSpace():
    p = os.popen("df -h /")
    i = 0
    while 1:
        i = i + 1
        line = p.readline()
        if i == 2:
            return (line.split()[1:5])
#---------------------------------------功能-----------------------------------------
def getSettings():
    global settings
    settings = []

    address = get_file_adr()+'/seed_setting.txt'

    file_setting = open(address,'r')
    setting = file_setting.readlines()
    file_setting.close()


    for i in setting:
        settings.append(i.replace('\n',''))
   
    try:
        settings[2] = int(setting[2])
    except:
        settings[2] = 0

    if len(setting) > 3:
        try:
            settings[3] = int(setting[3])
        except:
            settings[3] = 0
        
        try:
            settings[4] = int(setting[4])
        except:
            settings[4] = 0
#-----------------------------------------------------------------------------------------
def getIPaddress():
    i = 0
    ifconfig = os.popen('ifconfig').readlines()
    ifconfig_ex = []

    while i < len(ifconfig):
        if len(ifconfig[i]) == 1:
            ifconfig_ex.append(ifconfig[0:i])
        i += 1

    i = len(ifconfig_ex)-1
    while i >= 1:
        ifconfig_ex[i] = ifconfig_ex[i][len(ifconfig_ex[i-1])+1:]
        i -= 1
    
    for i in ifconfig_ex:
        
        this = i[1]
        pointAddress = this.find('inet')

        if this.find('Bcast') != -1:
            pointBcast = this.find('Bcast')
        elif this.find('bcast') != -1:
            pointBcast = this.find('bcast')
        elif this.find('BCAST') != -1:
            pointBcast = this.find('BCAST')
        elif this.find('广播') != -1:
            pointBcast = this.find('广播')
        elif this.find('broadcast') != -1:
            pointBcast = this.find('broadcast')
        else:
            pointBcast = -1
        if this.find('mask') != -1:
            pointMask = this.find('mask')
        elif this.find('Mask') != -1:
            pointMask = this.find('Mask')
        elif this.find('MASK') != -1:
            pointMask = this.find('MASK')
        elif this.find('掩码') != -1:
            pointMask = this.find('掩码')
        elif this.find('netmask') != -1:
            pointMask = this.find('metmask')
        else:
            pointMask = -1
            
        if  pointAddress != -1:
            if pointBcast != -1:
                if pointMask != -1:

                    this = this[pointAddress+5:pointBcast]
                    number = this.find(':')
                    if number != -1:
                        this = this[number+1:]
                    if this[0:1] == ' ':
                        this = this[1:]
                    number = this.find(' ')
                    if number != -1:
                        this = this[0:number]
                    return this     
#-----------------------------------------------------------------------------------------
def testMEDIA():
    global point
# 测试音频
    if point[1] == True:
        Audio = 'Audio Running'
    else:
        try:
            import pyaudio
            pa = pyaudio.PyAudio()
            stream = pa.open(format=pyaudio.paInt16, 
                             channels=1, 
                             rate=44100, 
                             input=True,
                             frames_per_buffer=1000)
            this = stream.read(1000)
        except:
            Audio = 'NO Audio'
        else:
            Audio = 'AUDIO'
# 测试视频
    try:
        import pygame
    except:
        Vidio = 'NOvidio'
    else:
        Vidio = 'VIDIO'

    MediaInfo = [Audio, Vidio]
    return MediaInfo
#-----------------------------------------------------------------------------------------
def net():
    # 连接情况
    global socket_server , connect
    Net = 'NOPE'
    try:
        if type(socket_server) == socket.socket:
            if connect[0].info[0] == 'Out':
                Net = 'SERVER'
        if len(connect) > 0:
            if connect[0].info[0] != 'Out':
                if Net == 'SERVER':
                    Net += ' & CONNECT'
                else:
                    Net = 'CONNECT'
    except:
        pass
    return Net
#-----------------------------------------------------------
def getWindowInfo():
    global tk

    if type(tk) == tkinter.Tk:
        window = True
    else:
        window = False
    return window
#-------------------------------------算法-----------------------------------------


def dft(fCtD, w0, max_w, dirta_w,dirta_t):
    global sinAOcos , res_dft
    res = []
    max_t = len(fCtD) ; w = w0

    while w <= max_w:
        t = 0
        n = 0 ; ni = 0
        #num_w = int(w / dirta_w)
        while t < max_t:
            #num_t = int(t / dirta_t)
            n += int(fCtD[t])*math.cos(t*3.14*w/44100)
            ni += int(fCtD[t])*math.sin(t*3.14*w/44100)
            t += dirta_t

        mo = round((n**2 + ni**2)**0.5 / (max_t / (2 * dirta_t)))
        res.append(mo)
        res_dft = res
        w += dirta_w
#---------------------------------------------------------------------------------------
def join_string(I ,string):
    long = len(I) ; this = []
    adr = string.find(I)
    while adr != -1:
        this.append(string[0:adr])
        string = string[adr+long:]
        adr = string.find(I)
    if this == []:
        this = string
    else:
        this.append(string)
    return this
def join_many(string,num):
    if num == -1:
        num = 0;
        change = True
        while change == True:
            change = False
            if string.find('(' + str(num) + ')') != -1:
                num += 1
                change = True
        num -= 1
    this = join_string('('+str(num)+')',string)
    if type(this) == str:
        return this
    elif type(this) == list:
        that = []
        for i in this:
            that.append(Info(i,num-1))
        return that
def Info(gop,num):
    # 有关于连接数据的解码程序
    #P.S.这个部分尚可优化
    if type(gop) == str:
        return join_many(gop,num)
    elif type(gop) == list:
        info = []
        for i in gop:
            info.append(Info(i,num))
        return info
#----------------------------------------------------------------------
def InfoAdd():
    global Me , settings
    this = [] ; this1 = []
    if Me != ['','','']:
        this.append('Name:'+Me[0][0])

        this1.append(Me[0][1])
        this1.append(str(settings[3]))
        this1.append(str(settings[4]))
        this1.append('to')
        this1.append(str(settings[1]))
        this1.append(str(settings[2]))
        this.append('   '.join(this1))  ; this1 = []
        
        this1.append(int(Me[1][0][0])) 

        this1.append(round((1-(float(Me[1][1][2])/float(Me[1][1][0])))*100))
        this1.append(int(Me[1][2][2].replace('%','')))
        this.append(this1)
        return this
    else:
        return ['','',[0,0,0],]
#-------------------------------------------------------------------------------------
load = aThread(-5 , 'Me' ,0 , 0)
load.start() 
