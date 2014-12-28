$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$ahkFile = "$scriptPath\killwinhotkey.ahk"

if (Test-Path "${env:programfiles(x86)}\WinHotKey")
{
    $uninstallerPath = "${env:programfiles(x86)}\WinHotKey\unins000.exe"
}
else
{
	$uninstallerPath = "${env:programfiles}\WinHotKey\unins000.exe"
}

try {
	Start-Process 'AutoHotkey' $ahkFile
	Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallerPath
	Write-ChocolateySuccess $packageName
	} catch {
	Write-ChocolateyFailure $packageName $($_.Exception.Message)
	throw
}
