$packageName = 'geforce-game-ready-driver-win7'
$version = '375.86'
$fileType = 'exe'
$silentArgs = '-s -noreboot -clean'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/375.86/375.86-desktop-win8-win7-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/375.86/375.86-desktop-win8-win7-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum ea55c09cc072f8430c503aa99829b550087cd6152dccc358c7dbcd432f422cf4 -ChecksumType 'sha256' -Checksum64 2240304d13b8857d605cbffbf023eabc8424c5b49b9dc427602991be72da3f84 -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
