$packageName = '{{PackageName}}'
$installerType = 'EXE'
$silentArgs = '/S'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$ahkFile = "$scriptPath\msiafterburneruninstall.ahk"
$registryPath32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Afterburner'
$registryPathWow6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Afterburner'

$ProcessActive = Get-Process MSIAfterburner* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null){
	Stop-Process -ProcessName MSIAfterburner*
	}	

Start-Process 'AutoHotkey' $ahkFile	

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
	Uninstall-ChocolateyPackage $packageName $installerType $silentArgs $uninstallString
	} 
