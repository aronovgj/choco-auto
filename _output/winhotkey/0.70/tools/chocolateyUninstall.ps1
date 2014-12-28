$packageName = 'winhotkey'
$fileType = 'exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'

if (Test-Path "${env:programfiles(x86)}\WinHotKey")
{
    $uninstallerPath = "${env:programfiles(x86)}\WinHotKey\unins000.exe"
}
else
{
	$uninstallerPath = "${env:programfiles}\WinHotKey\unins000.exe"
}

try {
	Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallerPath
	Write-ChocolateySuccess $packageName
	} catch {
	Write-ChocolateyFailure $packageName $($_.Exception.Message)
	throw
	}
