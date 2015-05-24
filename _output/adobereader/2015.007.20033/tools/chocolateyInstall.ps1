$packageName = 'adobereader'
$installerType = 'EXE'
$silentArgs = '/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES'
$url = 'http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1500720033/AcroRdrDC1500720033_MUI.exe'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"
