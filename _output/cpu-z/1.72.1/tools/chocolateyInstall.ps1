$packageName = 'cpu-z'
$installerType = 'EXE'
$url = 'ftp://ftp.cpuid.com/cpu-z/cpu-z_1.72.1-en.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) 

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes

