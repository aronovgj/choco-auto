$packageName = 'inssider'
$version = '3.1.2.1'
$fileType = 'MSI'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$ahkFile = "$scriptPath\uninstallInSSIDer.ahk"

function Find-CID {
  param([String]$croot, [string]$cdname, [string]$version)

  if (Test-Path $croot) {
    Get-ChildItem -Force -Path $croot | foreach {
      $CurrentKey = (Get-ItemProperty -Path $_.PsPath)
      if ($CurrentKey -match $cdname -and $CurrentKey -match $version) {
        return $CurrentKey.PsChildName
      }
    }
  }
  return $null
}

  $uroot = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
  $uroot64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
  $registryPath = Find-CID $uroot "inSSIDer" "$version"
  if ($registryPath -eq $null) {
    # try 64bit registry
    $registryPath = Find-CID $uroot64 "inSSIDer" "$version"
  }
  if ($registryPath -eq $null) {
  } else {
    Start-Process 'AutoHotkey' $ahkFile	
    Uninstall-ChocolateyPackage $packageName $fileType $registryPath -validExitCodes @(0)
  }
