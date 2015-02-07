$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$ahkFile = "$scriptPath\killwinhotkey.ahk"
$registryPath32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\WinHotKey_is1'
$registryPathWow6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\WinHotKey_is1'


try {
 
  if (Test-Path $registryPath32) {
    $registryPath = $registryPath32
  }
 
  if (Test-Path $registryPathWow6432) {
    $registryPath = $registryPathWow6432
  }
 
  if ($registryPath) {
    $uninstallString = (Get-ItemProperty -Path $registryPath -Name 'UninstallString').UninstallString
  }
 
  if ($uninstallString) {
  	Start-Process 'AutoHotkey' $ahkFile
    Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallString
    }
 
} catch {
  throw $_.Exception
}