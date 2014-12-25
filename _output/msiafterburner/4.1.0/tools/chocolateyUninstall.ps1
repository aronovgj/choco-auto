$packageName = 'msiafterburner'
$installerType = 'EXE'
$silentArgs = '/S'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$ahkFile = "$scriptPath\msiafterburneruninstall.ahk"

try{
  $unpath = "${Env:ProgramFiles(x86)}\MSI Afterburner\Uninstall.exe"
  Start-Process 'AutoHotkey' $ahkFile
  Uninstall-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$unpath" -validExitCodes $validExitCodes
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
