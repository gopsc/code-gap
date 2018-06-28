
import time
import _thread
import tkinter


window = tkinter.Tk()
canvas = tkinter.Canvas(
                         window,
                         width  = 323,
                         height = 200,
                         bg     = "white"
                       )
r        = 5
xy       = [ [ 323,                       200 ] ]
xy.append( [   xy[0][0]/2,                xy[0][1] - xy[0][1]/1.618 ] )
xy.append( [   xy[0][0]/2,                xy[0][1]/1.618 ] )
xy.append( [   xy[0][0] - xy[0][0]/1.618, xy[0][1]/2] )
xy.append( [   xy[0][0]/1.618,            xy[0][1]/2] )
d        = [10]
oval     = [0,0,0,0]
tag_oval = [
               'oval0',
               'oval1',
               'oval2',
               'oval3'
              ]




def canvas_draw():

    for i in range(4):

        oval[0] = canvas.create_oval(
                                      xy[i+1][0] - r,
                                      xy[i+1][1] - r,
                                      xy[i+1][0] + r,
                                      xy[i+1][1] + r,
                                      fill    = "#F0F8FF",
                                      outline = "#F0F8FF",
                                      tag     = tag_oval[i]
                                    )

def canvas_delete():

    for i in range(4):

        canvas.delete(tag_oval[i])


def canvas_move():

    while 1:
   
        for i in range(4):

# Outline's F

            xy[i+1][0] += 200/(xy[i+1][0])
            xy[i+1][0] -= 200/(xy[0][0]    - xy[i+1][0])
            xy[i+1][1] += 200/(xy[i+1][1])
            xy[i+1][1] -= 200/(xy[0][1]    - xy[i+1][1])

            for o in range(4):

# Balls' F

                if o != i :

# kx - y + b = 0

                    k = (
                         (xy[o+1][0]-xy[i+1][0])
                      /  (xy[o+1][1]-xy[i+1][1])
                        )

                    b = xy[i+1][1] - k*xy[i+1][0]

                    l = (
                         (xy[o+1][0]-xy[i+1][0])**2
                       + (xy[o+1][1]-xy[i+1][1])**2
                        ) ** 0.5

                    print (i+1, o+1, int(xy[i+1][0]), int(xy[i+1][1]), int(xy[o+1][0]), int(xy[o+1][1]))

                    if  xy[o+1][0] <  xy[i+1][0]:
                        xy[i+1][0] += (200/l)*(xy[o+1][0]-xy[i+1][0])*k
                    else:
                        xy[i+1][0] -= (200/l)*(xy[o+1][0]-xy[i+1][0])*k

                    if  xy[o+1][1] <  xy[i+1][1]:
                        xy[i+1][1] += (200/l)*(xy[o+1][1]-xy[i+1][1])*k
                    else:
                        xy[i+1][1] -= (200/l)*(xy[o+1][1]-xy[i+1][1])*k

#                    l = (
#                            (xy[o+1][0] - xy[i+1][0]) ** 2
#                          + (xy[o+1][1] - xy[i+1][1]) ** 2
#                        ) ** 0.5


        time.sleep(0.1)
        canvas_delete()
        canvas_draw()
        canvas.update()
        exit()


window.title("Canvas Test")
window.overrideredirect(True)
window.geometry('+300+200')

canvas.pack()
canvas.bind('<Button-1>', exit)
canvas_draw()

try:
    _thread.start_new_thread( canvas_move, () )
except:
    print ("Error: thread sratting failed.")

window.mainloop()
