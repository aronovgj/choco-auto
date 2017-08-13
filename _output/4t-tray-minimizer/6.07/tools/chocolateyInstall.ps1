$packageName = '4t-tray-minimizer'
$installerType = 'EXE'
$url = 'http://www.4t-niagara.com/files/4t-min.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) 

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -Checksum 83a98299d004ca3c322df167a5d35c377e92d1ee8aea94bf15b07cff4176913d -ChecksumType 'sha256' -validExitCodes $validExitCodes

