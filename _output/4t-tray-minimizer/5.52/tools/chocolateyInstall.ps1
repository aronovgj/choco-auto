$packageName = '4t-tray-minimizer'
$installerType = 'EXE'
$url = 'http://www.4t-niagara.com/files/4t-min.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) 

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -Checksum 3d58ad60eb34530e4920ca7464a77ef193f743fafa8c054ff5d6e55ab8c07f75 -ChecksumType 'sha256' -validExitCodes $validExitCodes

