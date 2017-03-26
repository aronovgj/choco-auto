$packageName = 'gridmove'
$fileType = 'exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
$uninstallerPath = "${env:programfiles(x86)}\GridMove\unins000.exe"
try {
Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $uninstallerPath
Write-ChocolateySuccess $packageName
} catch {
Write-ChocolateyFailure $packageName $($_.Exception.Message)
throw
}
