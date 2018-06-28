 
import sys





if len(sys.argv) != 2:
    print("PLEASE TYPE: python3 .../*.py id")




that_id      = sys.argv[1]
buffer_count = 1
buffer_file  = []
buffer_blog  = []
buffer_note  = []
buffer_time  = []


while 1:

    buffer_file  = "/opt/gop/library/micro-blog/"
    buffer_file += that_id
    buffer_file += "/"
    buffer_file += str(buffer_count)
    buffer_file += ".txt"
    try:
        buffer_file  = open(buffer_file, "r")
    except:
        break
    buffer_blog  = buffer_file.readlines()
    buffer_file.close()

    buffer_year      = buffer_blog[0].find("年")
    buffer_month     = buffer_blog[0].find("月")
    buffer_day       = buffer_blog[0].find("日")
    buffer_hour      = buffer_blog[0].find(":")
    buffer_today     = buffer_blog[0].find(" ")
    buffer_yesterday = buffer_blog[0].find("昨天")
    buffer_after     = buffer_blog[0].find("前天")

    if buffer_year != 4:

        if buffer_yesterday != -1:
            buffer_blog[0] = "2018年1月2日" + buffer_blog[0][buffer_yesterday+2:]
        elif buffer_after != -1:
            buffer_blog[0] = "2018年1月1日" + buffer_blog[0][buffer_after+2:]
        elif buffer_today == -1 and buffer_hour != -1:
            buffer_blog[0] = "2018年1月3日 " + buffer_blog[0]
        else:
            buffer_note.append("")
            for i in range(len(buffer_note)):
                buffer_note[len(buffer_note) - 1 - i] = buffer_note[len(buffer_note) - 1 - i - 1]
            buffer_blog[0] = "1970年0月0日 00:00\n"

    try:
        buffer_year      = buffer_blog[0].find("年")
        buffer_month     = int(buffer_blog[0][buffer_blog[0].find("月") - 1])
        buffer_day       = buffer_blog[0].find("日")
        buffer_hour      = buffer_blog[0].find(":")
        buffer_today     = buffer_blog[0].rfind(" ")
        buffer_yesterday = buffer_blog[0].find("昨天")
        buffer_after     = buffer_blog[0].find("前天")

        buffer_time  = (int(buffer_blog[0][0:buffer_year]) - 1970) *  365
        buffer_time += (int(buffer_blog[0][0:buffer_year]) // 4 - 492)

        if   buffer_month >= 2:
            buffer_time += 31
        elif buffer_month >= 3:
            buffer_time += 28
        elif buffer_month >= 4:
            buffer_time += 31
        elif buffer_month >= 5:
            buffer_time += 30
        elif buffer_month >= 6:
            buffer_time += 31
        elif buffer_month >= 7:
            buffer_time += 30
        elif buffer_month >= 8:
            buffer_time += 31
        elif buffer_month >= 9:
            buffer_time += 31
        elif buffer_month >= 10:
            buffer_time += 30
        elif buffer_month >= 11:
            buffer_time += 31
        elif buffer_month >= 12:
            buffer_time += 30

        buffer_time += int(buffer_blog[0][buffer_day - 1])
        buffer_time  = buffer_time * 86400
        buffer_time += int(buffer_blog[0][buffer_today+1:buffer_hour]) * 60
        buffer_time += int(buffer_blog[0][buffer_hour+1:buffer_hour+3])

    except:

        break

    buffer_note.append("")
    buffer_note.append("")
    buffer_note.append("")

    for i in range(len(buffer_note) - 3):

        buffer_note[len(buffer_note) - 1 - i] = buffer_note[len(buffer_note) - 1 - i - 3]

    buffer_note[0] = str(buffer_time) + "\n"
    buffer_note[1] = ""
    buffer_note[2] = "\n"

    for i in range(len(buffer_blog)):
        if i != 0:
            buffer_note[1] += buffer_blog[i][:-1] + "\\n"

    buffer_count += 1



print(buffer_count)

buffer_file  = "/opt/gop/note/" + that_id + ".note"
buffer_file  = open(buffer_file, "w")
buffer_file.writelines(buffer_note)
buffer_file.close()