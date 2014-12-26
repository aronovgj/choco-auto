$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/S'
$url = '{{DownloadUrl}}'

try {
    new-item "${env:temp}\afterburner" -itemtype directory
    $unpackfile = "${env:temp}\afterburner\afterburner.zip"
    $unpackdir = "${env:temp}\afterburner"
    Stop-Process -ProcessName MSIAfterburner*
    #$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
    #$ahkFile = "$scriptPath\msiafterburnerinstall.ahk"
    Get-ChocolateyWebFile $packageName $unpackfile $url
    Get-ChocolateyUnzip $unpackfile $unpackdir
    $file = "${env:temp}\afterburner\MSIAfterburnerSetup410.exe"
    #Start-Process 'AutoHotkey' $ahkFile
    Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
    Remove-Item $unpackdir -Recurse -Force
    Write-ChocolateySuccess $packageName
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw 
}
