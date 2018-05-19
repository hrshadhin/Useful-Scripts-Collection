#!/usr/bin/python
import os
import random
ran=str(random.randint(1,39))
tempcomnd="cp -f /home/usernam/grubimage/source/1.png /home/usernam/grubimage/"
user=os.getenv('USERNAME')             #Find current username of system
b=tempcomnd.replace("usernam", user) #Replace username
comnd=b.replace("1",ran)             #replace "1" with random no
os.system(comnd)

#now the file replace part

tempreplacecomnd ="mv /home/username/grubimage/"+ ran +".png " + "/home/username/grubimage/1.png"
replacecomnd=tempreplacecomnd.replace("username" , user)
os.system(replacecomnd)
