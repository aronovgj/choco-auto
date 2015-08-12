# watchdog for the log directory of chocolateypackageupdater. copies log to 
# 'C:\\ProgramData\\sortedchocolateypackageupdater\\', sorts it by name/date
# and adds information about what kind of log message it is.
#needs watchdog and gntp (get it with pip)

import time
import re
import os
import gntp.notifier
from watchdog.observers import Observer
from watchdog.events import LoggingEventHandler
from watchdog.events import FileSystemEventHandler
from operator import itemgetter
from compiler.ast import flatten

notify = []
other_messages = []
def split_list(filename):
    l=[]
    flatlist = []
    fileold = open(path + filename).readlines()
    fileold.pop(0)
    fileold.pop(len(fileold)-1)
    #split date, time, id
    for line in fileold:
        #filter lines not starting with date
        if re.match(r"^\d{2}.\d{2}.\d{4}\s\d{2}:\d{2}:\d{2}:",line):
            l.append(line.split(' ', 3))
        else:
            if("has been installed" in line):
                notify.append(line)
            #if lines not starting with date, append to other list to
            #print these messages at the end of the new file
            other_messages.append(line)
    #split time
    for entry in l:
        entry[1]=entry[1].split(':',3)
    #flatten time sublist 
    for i in l:
        flatlist.append(flatten(i))
    #os.remove(path + filename)
    return flatlist

def sort_list(flatlist):    
    for entry in flatlist:
        #convert to tuples to be able to sort
        tuplist = [tuple(entry) for entry in flatlist]
        #sort by name of package, then by seconds, minutes, hours
        newlist=sorted(tuplist, key=itemgetter(5,3,2,1))
    return newlist

# writes info at the start of a line
def write_info(line):
    if 'Failed' in line:
        gntp.notifier.mini(line)
        line = '=====================[ERROR]=====================\n' + line
        #notify if failed        
    else:
        line = '[INFO]' + line
    return line

#write to file
def write_list(newlist, filename):
    if not os.path.exists(destpath):
        os.makedirs(destpath)
    filenew = open(destpath + filename, "w")
    for line in newlist:
        # restore format
        line=line[0] + " " +line[1] + ":" + line[2]+":" + line[3]+":" + line[4]+" " + line[5]  + " " + line[6]
        line = write_info(line)
        filenew.write(line)
    for line in other_messages:
        filenew.write(line)
    #notify if installed
    for line in notify:
        gntp.notifier.mini(line)
    del other_messages[:]
    del notify[:]
    filenew.close()


# watchdog for log directory
class MyHandler(FileSystemEventHandler):
    def on_modified(self, event):        
        s = str(event)
        fileregex = "ketarin\.\d{8}_\d{4}\.log"
        filename = re.findall(fileregex, s)
        if filename != []:            
            filename = re.findall(fileregex, s)[0]
            split = split_list(filename)
            sort = sort_list(split)
            write_list(sort, filename)

if __name__ == "__main__":
    path = 'C:\\ProgramData\\chocolateypackageupdater\\'
    destpath = 'C:\\ProgramData\\sortedchocolateypackageupdater\\'
    event_handler = MyHandler()
    observer = Observer()
    observer.schedule(event_handler, path, recursive=False)
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()

