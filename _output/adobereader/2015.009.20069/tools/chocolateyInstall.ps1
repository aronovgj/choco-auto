$packageName = 'adobereader'
$installerType = 'EXE'
$silentArgs = '/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES'
$url = 'http://ardownload.adobe.com/pub/adobe/reader/win/11.x/11.0.00/misc/AdbeRdr11000_mui_Std.zip'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"
