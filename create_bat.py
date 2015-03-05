# creates a .bat containing the install-command for chocolatey and a cinst command for all the packages currently installed on your system. just try it.

import subprocess
import os
import re

#cmd command to install chocolatey
chocoinst = r"""@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"""
warning = ['Config has insecure allowGlobalConfirmation set to true.', ' This setting lowers the integrity of the security of your system. If', ' this is not intended, please change the setting using the feature', ' command.']
chocoversion = "Chocolatey v([0-9].{0,1})*"
proglist = []
prelist = []

#check if .bat already exists. if yes, delete it
if os.path.isfile("installs.bat") == True:
    os.remove("installs.bat")
    
#execute clist -lo
p = subprocess.Popen("clist -lo", stdout = subprocess.PIPE, shell = True)
#save output from cmd
(output, err) = p.communicate()


#format output to proper string, deleting version numbers after the program names
s = output.split('\r\n')
for entry in s[:-2]:
    # filter warnings and infos
    if (entry != '' and entry not in warning and not re.match(chocoversion, entry)):
        # separate ids from version numbers
        parts = entry.split(' ')
        prog = parts[0]
        appendix = parts[1]
        # check for previews
        if ('-' in appendix):
            prelist.append(prog)
        else:
            proglist.append(prog)

progliststring = ' '.join(proglist)
preliststring = ' '.join(prelist)

#create new bat
file=open("installs.bat", "w")
#write chocolatey install command and the packages to be installed to .bat
file.write(chocoinst + "\n\n" + "cinst " + progliststring)
#write command to install prereleases
file.write("\n\n" + "cinst --pre " + preliststring)
#write number of packages
file.write("\n\n" + "::number of packages: " + str(len(proglist) + len(prelist)))
#save file
file.close()
