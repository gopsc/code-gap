



import time
import _thread
import tkinter

#==========================================================================

r         = 5
w         = 1
d         = [10]

F1        = 10
F2        = 0.5

xy        = []

xy.append(  [   323,                       200                       ] )

xy.append(  [   xy[0][0]/2,                xy[0][1] - xy[0][1]/1.618 ] )  # up
xy.append(  [   xy[0][0]/1.618,            xy[0][1]/2                ] )  # right
xy.append(  [   xy[0][0]/2,                xy[0][1]/1.618            ] )  # down
xy.append(  [   xy[0][0] - xy[0][0]/1.618, xy[0][1]/2                ] )  # left

#--------------------------------------------------------------------------

buffer_xy = []
buffer_xy.append(xy[0])
buffer_xy.append(xy[1])
buffer_xy.append(xy[2])
buffer_xy.append(xy[3])
buffer_xy.append(xy[4])

#--------------------------------------------------------------------------

oval      = [0,0,0,0]

tag_oval  = [
              'oval0',
              'oval1',
              'oval2',
              'oval3'
            ]

#--------------------------------------------------------------------------

line      = [0,0,0,0]

tag_line  = [
              'line0',
              'line1',
              'line2',
              'line3'
            ]

#--------------------------------------------------------------------------

window = tkinter.Tk()
canvas = tkinter.Canvas(
                         window,
                         width  = xy[0][0],
                         height = xy[0][1],
                         bg     = "white"
                       )

title = canvas.create_oval(
                            xy[0][0]*(9/10) - r / 1.618,
                            xy[0][1]*(1/10) - r / 1.618,
                            xy[0][0]*(9/10) + r / 1.618,
                            xy[0][1]*(1/10) + r / 1.618,
                            fill    = "#F0F8FF",
                            outline = "#F0F8FF",
                            tag     = "title"
                          )

#==========================================================================

def canvas_draw():

    for i in range(4):

        oval[i] = canvas.create_oval(
                                      xy[i+1][0] - r,
                                      xy[i+1][1] - r,
                                      xy[i+1][0] + r,
                                      xy[i+1][1] + r,
                                      fill    = "#F0F8FF",
                                      outline = "#F0F8FF",
                                      tag     = tag_oval[i]
                                    )

#--------------------------------------------------------------------------

        if i == 3:
            line[i] = canvas.create_line(
                                          xy[i+1][0],
                                          xy[i+1][1],
                                          xy[1][0],
                                          xy[1][1],
                                          fill    = "#F0F8FF",
                                          width   = w,
                                          tag     = tag_line[i]
                                        )

        elif i < 3:
            line[i] = canvas.create_line(
                                          xy[i+1][0],
                                          xy[i+1][1],
                                          xy[i+2][0],
                                          xy[i+2][1],
                                          fill    = "#F0F8FF",
                                          width   = w,
                                          tag     = tag_line[i]
                                        )

#==========================================================================

def canvas_delete():

    for i in range(4):

        canvas.delete(tag_oval[i])
        canvas.delete(tag_line[i])

#==========================================================================

def canvas_move():

    while 1:
   
        for i in range(4):

#--------------------------------------------------------------------------
# In the canvas.

            if xy[i][0] < 0:
                buffer_xy[i][0] = 0

            if xy[i][0] > xy[0][0]:
                buffer_xy[i][0] = xy[0][0]

            if xy[i][1] < 0:
                buffer_xy[i][1] = 0

            if xy[i][1] > xy[0][1]:
                buffer_xy[i][1] = xy[0][1]

#--------------------------------------------------------------------------
# Outline's F

            buffer_xy[i+1][0] += F1 * (1 - (xy[i+1][0]              ) / xy[0][0])
            buffer_xy[i+1][0] -= F1 * (1 - (xy[0][0]    - xy[i+1][0]) / xy[0][0])
            buffer_xy[i+1][1] += F1 * (1 - (xy[i+1][1]              ) / xy[0][1])
            buffer_xy[i+1][1] -= F1 * (1 - (xy[0][1]    - xy[i+1][1]) / xy[0][1])

#--------------------------------------------------------------------------
# Balls' F

            for o in range(4):

                if o != i :

#--------------------------------------------------------------------------
# kx - y + b = 0

                    if int(xy[o+1][0] - xy[i+1][0]) != 0 and int(xy[o+1][1] - xy[i+1][1]) != 0:

                        k = (
                             (xy[o+1][1] - xy[i+1][1])
                          /  (xy[o+1][0] - xy[i+1][0])
                            )

                        b = xy[i+1][1] - k*xy[i+1][0]

                    else:

                        k = 1
                        b = 0

#--------------------------------------------------------------------------

                    l = (
                         (xy[o+1][0] - xy[i+1][0])**2
                       + (xy[o+1][1] - xy[i+1][1])**2
                        ) ** 0.5

#--------------------------------------------------------------------------

                    if         xy[o+1][0] <  xy[i+1][0]:

                        buffer_xy[i+1][0] += F2 * (1 - (l/k)/xy[0][0])

                    elif       xy[o+1][0] >  xy[i+1][0]:

                        buffer_xy[i+1][0] -= F2 * (1 - (l/k)/xy[0][0])

#--------------------------------------------------------------------------

                    if         xy[o+1][1] < xy[i+1][1]:

                        buffer_xy[i+1][1] += F2 * (1 - (l*k)/xy[0][1])

                    elif       xy[o+1][1] > xy[i+1][1]:

                        buffer_xy[i+1][1] -= F2 * (1 - (l*k)/xy[0][1])

#--------------------------------------------------------------------------

#                    l = (
#                            (buffer_xy[o+1][0] - buffer_xy[i+1][0]) ** 2
#                          + (buffer_xy[o+1][1] - buffer_xy[i+1][1]) ** 2
#                        ) ** 0.5

#--------------------------------------------------------------------------
# Move it

            for i in range(4):

                xy[i+1] = buffer_xy[i+1]

#--------------------------------------------------------------------------

        time.sleep(0.1)
        canvas_delete()
        canvas_draw()
        canvas.update()

#==========================================================================

window.title("Canvas Test")
window.overrideredirect(True)
window.geometry('+323+200')

canvas.pack()
canvas.bind('<Button-1>', exit)
canvas_draw()

try:
    _thread.start_new_thread( canvas_move, () )
except:
    print ("Error: thread sratting failed.")

window.mainloop()




