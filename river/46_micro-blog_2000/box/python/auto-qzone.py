
import os
import sys
import time
from PIL import Image






count = 1
qq_id = ''



if len(sys.argv) == 1:

    print( 'Please type \' python3 [qq_id] [beginning id] \'' )
    quit()

if len(sys.argv) > 1:

    if sys.argv[1] == 'down':

        os.system( "xdotool mousemove 1700 20" )
        time.sleep(0.1)

        os.system( "xdotool click     1" )
        time.sleep(0.1)

        while 1:

            os.system( "xdotool key       Down" )
            time.sleep(0.1)

    if sys.argv[1] != 'down':

        qq_id = sys.argv[1]

if len(sys.argv) > 2:

    try:

        count = int(sys.argv[2])

    except:

        print("Please type number of the beginning.")
        quit()





# This will be used after this all
#os.system("scrot /opt/gop/screenshot.png")

target   = [0, 0, 0, 0, 0, 0]

image    = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
#image[0] = Image.open('/opt/gop/screenshot.png')
image[1] = Image.open('/opt/?/box/library/auto-qzone-1.png')
image[2] = Image.open('/opt/?/box/library/auto-qzone-2.png')
image[3] = Image.open('/opt/?/box/library/auto-qzone-3.png')
image[4] = Image.open('/opt/?/box/library/auto-qzone-4.png')
image[5] = Image.open('/opt/?/box/library/auto-qzone-5.png')

# 裁剪
#image[4] = image[0].crop( (1180, 170, 1200, 185) )

# 尺寸
size     = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
size[1]  = image[1].size
size[2]  = image[2].size
size[3]  = image[3].size
size[4]  = image[4].size
size[5]  = image[5].size

# 颜色
#pixel = getpixel((w, h,))
pixel    = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
pixel[1] = image[1].load()
pixel[2] = image[2].load()
pixel[3] = image[3].load()
pixel[4] = image[4].load()
pixel[5] = image[5].load()

# 缩放
#image[0].thumbnail((w//2, h//2))

# 旋转
#image[0].rotate(45)

# 显示
#image[0].show()

# 保存
#image[4].save('/opt/?/box/library/auto-qzone-4.png')



def find_image( s1, s2 ):

    number = 0
    step   = 1
    point = [-1, -1]
    limit  = 0.80 * (size[s2][0]//step) * (size[s2][1]//step)

    for w in range(size[s1][0] - size[s2][0]):

        for h in range(size[s1][1] - size[s2][1]):

            number = 0

            if point == [-1, -1]:

                ww = 0 - step

                while ww < size[s2][0] - 1 -step :

                    ww += step
                    hh = 0 - step

                    while hh < size[s2][1] - 1 - step :

                        hh += step
# 颜色
                        if  pixel[s1][w+ww, h+hh] == pixel[s2][ww, hh]:

                            number += 1

                            if number >= limit :

                                point[0] = w
                                point[1] = h

    print(point)
    return point






def save_text( count ):

    
    os.system( "xdotool mousemove 825 20" )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 825 120" )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 500 195" )
    time.sleep(0.1)

    os.system(
               "xdotool type /opt/?/box/library/micro-blog/"
             + qq_id
             + "/"
             + str(count)
             )
    time.sleep(0.1)

    os.system( "xdotool key       Return" )
    time.sleep(0.3)

    os.system( "xdotool key       Return" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 1700 20" )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)





def copy_blog( count ):


    os.system(
                " xdotool mousemove " + str(target[0][0]+1700-450) + " " + str(target[0][1]+140+35)
             +  "         mousedown 1"
             +  "         mousemove " + str(target[0][0]+1700-300) + " " + str(target[0][1]+140+35)
             +  "         mouseup 1"
             )
    time.sleep(0.1)

    os.system( "xdotool key ctrl+c" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 100 100" )
    time.sleep(0.1)

    os.system( "xdotool click 1" )
    time.sleep(0.1)

    os.system( "xdotool key ctrl+a" )
    time.sleep(0.1)

    os.system( "xdotool key ctrl+v" )
    time.sleep(0.1)

    if target[2] == [-1, -1] or target[2][1] - target[1][1] >= 50:
        os.system(
                   " xdotool mousemove " + str(target[0][0]+1700-505) + " " + str(target[0][1]+140+65)
                 + " sleep     0.1"

                 + " mousedown 1"
                 + " sleep     0.1"

                 + " mousemove " + str(target[1][0]+1700) + " " + str(target[1][1]+140-20)

                 + " mouseup   1"
                 + " sleep     0.1"

                 + " key       ctrl+c"

                 + " sleep     0.1"

                 + " mousemove 100 100"
                 )

    if target[2] != [-1, -1] and target[2][1] - target[1][1] < 0:
        os.system(
                   " xdotool mousemove " + str(target[0][0]+1700-505) + " " + str(target[0][1]+140+65)
                 + " sleep     0.1"

                 + " mousedown 1"
                 + " sleep     0.1"

                 + " mousemove " + str(target[1][0]+1700) + " " + str(target[2][1]+140-10)

                 + " mouseup   1"
                 + " sleep     0.1"

                 + " key       ctrl+c"

                 + " sleep     0.1"

                 + " mousemove 100 100"
                 )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 900 990" )
    time.sleep(0.1)

    os.system( "xdotool click     1" )
    time.sleep(0.1)

    os.system( "xdotool key Return" )
    time.sleep(0.1)

    os.system( "xdotool key       ctrl+v" )
    time.sleep(0.1)



    save_text( count )

    for i in range( (target[1][1])//40 + size[2][1]//40 + 1 ):

        os.system( "xdotool key Down" )
        time.sleep(0.1)

    time.sleep(0.5)





def copy_blog_old( count ):


    os.system(
                " xdotool mousemove " + str(target[4][0]+1120+40) + " " + str(target[4][1]+140+60)
             +  "         mousedown 1"
             +  "         mousemove 1900 " + str(target[3][1]+140-20)
             +  "         mouseup 1"
             )
    time.sleep(0.1)


    os.system( "xdotool key ctrl+c" )
    time.sleep(0.1)

    os.system( "xdotool mousemove 100 100" )
    time.sleep(0.1)

    os.system( "xdotool click 1" )
    time.sleep(0.1)

    os.system( "xdotool key ctrl+a" )
    time.sleep(0.1)

    os.system( "xdotool key ctrl+v" )
    time.sleep(0.1)




    save_text( count )

    for i in range( (target[3][1])//40 + size[4][1]//40 + 1 ):

        os.system( "xdotool key Down" )
        time.sleep(0.1)

    time.sleep(0.5)
























while(1):

    os.system("scrot /opt/gop/screenshot.png")

    image[0]  = Image.open('/opt/gop/screenshot.png')
    image[6]  = image[0].crop( (1740, 140, 1780, 1030) )
    image[7]  = image[0].crop( (1215, 140, 1255, 1030) )
    image[8]  = image[0].crop( (1175, 140, 1205, 1030)  )
    image[9]  = image[0].crop( (1140, 140, 1200, 1030) )
    image[0]  = image[0].crop( (1130, 110, 1750, 1030) )

    size[0]   = image[0].size
    size[6]   = image[6].size
    size[7]   = image[7].size
    size[8]   = image[8].size
    size[9]   = image[9].size

    pixel[0]  = image[0].load()
    pixel[6]  = image[6].load()
    pixel[7]  = image[7].load()
    pixel[8]  = image[8].load()
    pixel[9]  = image[9].load()

    target[0] = find_image(6, 1)
    target[1] = find_image(6, 2)
    target[2] = find_image(7, 3)
    target[3] = find_image(8, 4)
    target[4] = find_image(9, 5)



    if ( target[0] == [-1, -1] and target[3] == [-1, -1] ) or ( target[1] == [-1, -1] and target[3] == [-1, -1] ):

        os.system( "xdotool mousemove 1700 20" )
        time.sleep(0.1)

        os.system( "xdotool click     1" )
        time.sleep(0.1)

        os.system( "xdotool key Down" )
        time.sleep(0.5)

        os.system( "scrot /opt/gop/backup-" + str(count) + ".png" )

        continue

    if (target[2] != [-1, -1] and target[0][1] > target[2][1]) or (target[1] != [-1, -1] and target[0][1] > target[1][1]):

        os.system( "xdotool mousemove 1700 20" )
        time.sleep(0.1)

        os.system( "xdotool click     1" )
        time.sleep(0.1)


        for i in range( (target[1][1])//40 + size[2][1]//40 + 1 ):

            os.system( "xdotool key Down" )
            time.sleep(0.1)

        time.sleep(0.5)

        os.system( "scrot /opt/gop/backup-" + str(count) + ".png" )

        continue

    if target[0] != [-1, -1] and (target[3] ==
 [-1, -1] or target[3][1] > target[0][1]):

        copy_blog(count)
        count += 1
        continue

    if (target[4] != [-1, -1] and target[3][1] > target[3][1]):

        os.system( "xdotool mousemove 1700 20" )
        time.sleep(0.1)

        os.system( "xdotool click     1" )
        time.sleep(0.1)


        for i in range( (target[3][1])//40 + size[4][1]//40 + 1 ):

            os.system( "xdotool key Down" )
            time.sleep(0.1)

        time.sleep(0.5)

        os.system( "scrot /opt/gop/backup-" + str(count) + ".png" )

        continue

    if target[3] != [-1, -1]:

        copy_blog_old(count)
        count += 1






    os.system("rm /opt/gop/screenshot.png")
