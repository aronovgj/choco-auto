$packageName = 'viper4windows'
$fileType = 'exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$url = 'http://vipersaudio.com/swupdate/viper4windows/V4W_Setup.zip'
$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$ahkFile = "$scriptPath\viper4windowsinstall.ahk"

new-item "${env:temp}\viper4windows" -itemtype directory
$unpackfile = "${env:temp}\viper4windows\viper4windows.zip"
$unpackdir = "${env:temp}\viper4windows"
Get-ChocolateyWebFile $packageName $unpackfile $url -Checksum 642fe0c89e25792b9551b4b8d89f4aa091b1f081be94bee66d4dbdf526d9b949 -ChecksumType 'sha256'
Get-ChocolateyUnzip $unpackfile $unpackdir
$file = "${env:temp}\viper4windows\V4W_Setup_x86.exe"
$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
  $file = "${env:temp}\viper4windows\V4W_Setup_x64.exe"
}
Start-Process 'AutoHotkey' $ahkFile	
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file

Remove-Item $unpackdir -Recurse -Force

