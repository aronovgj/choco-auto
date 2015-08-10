$packageName = '4t-tray-minimizer'
$installerType = 'EXE'
$url = 'http://www.4t-niagara.com/files/4t-min.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) 

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes

