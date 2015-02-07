# creates a .bat containing the install-command for chocolatey and a cinst command for all the packages currently installed on your system. just try it.

import subprocess
import os

#cmd command to install chocolatey
chocoinst = r"""@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"""

#check if .bat already exists. if yes, delete it
if os.path.isfile("installs.bat") == True:
    os.remove("installs.bat")
    
#execute clist -lo
p = subprocess.Popen("clist -lo", stdout = subprocess.PIPE, shell = True)
#save output from cmd
(output, err) = p.communicate()

l=[]
#format output to proper string, deleting version numbers after the program names
s = output.split('\r\n')
for line in s[:-2]:
    prog = line.split(' ')[0]
    l.append(prog)
s = ' '.join(l)

#create new bat
file=open("installs.bat", "w")
#write chocolatey install command and the packages to be installed to .bat
file.write(chocoinst + "\n\n" + "cinst " + s + "\n\n" + "::number of packages: " + str(len(l)-1))
#save file
file.close()
