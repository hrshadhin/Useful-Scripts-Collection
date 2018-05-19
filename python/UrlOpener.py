#!/usr/bin/python3.2
from os import listdir , mkdir ,path,chdir
import shutil
filelist=listdir()
print(filelist)
for i in filelist:
    if i.endswith('.wav') == True:
        filename = i
        splitname = filename.split('_')
        print(splitname)
        name = splitname[0]
        date = splitname[1]
        year=date[0:4]
        month=date[4:6]
        if path.isdir(name) == True:
            chdir(name)
        else:
            mkdir(name)
            chdir(name)
        if path.isdir(year) == True:
            chdir(year)
        else:
            mkdir(year)
            chdir(year)
        if path.isdir(month) == True:
            chdir(month)
        else:
            mkdir(month)
            chdir(month)
        shutil.move(filename,month)
