$packageName = 'doxbox'
$installerType = 'exe'	
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$url = 'https://github.com/t-d-k/doxbox/releases/download/v6.0-beta/InstallDoxBox_v60Beta.exe'
$checksum = ''
$checksumType = 'sha1'
$validExitCodes = @(0)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes -Checksum "$checksum" -ChecksumType "$checksumType"