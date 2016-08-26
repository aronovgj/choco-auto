$packageName = 'hdtune'
$installerType = 'EXE'
$url = 'http://www.hdtune.com/files/hdtune_255.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -Checksum 4256abb5b5583aeb5c61937415555657a5ae3b76fcc59657edfcb3bce792f958 -ChecksumType 'sha256'  -validExitCodes $validExitCodes