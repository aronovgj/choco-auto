$packageName = 'cpu-z'
$installerType = 'EXE'
$url = 'http://download.cpuid.com/cpu-z/cpu-z_1.74-en.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) 

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes

