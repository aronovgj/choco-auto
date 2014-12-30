$packageName = '7-taskbar-tweaker'
$installerType = 'EXE'
$silentArgs = '/S'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

try{
  $unpath = "$env:APPDATA\7+ Taskbar Tweaker\uninstall.exe"
  Uninstall-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$unpath" -validExitCodes $validExitCodes
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
