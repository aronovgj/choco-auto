$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/S'
$url = '{{DownloadUrl}}'

try {
    new-item "${env:temp}\afterburner" -itemtype directory
    $unpackfile = "${env:temp}\afterburner\afterburner.zip"
    $unpackdir = "${env:temp}\afterburner"
    $ProcessActive = Get-Process MSIAfterburner* -ErrorAction SilentlyContinue
    if($ProcessActive -ne $null)
    {
        Stop-Process -ProcessName MSIAfterburner*
    }
    Get-ChocolateyWebFile $packageName $unpackfile $url
    Get-ChocolateyUnzip $unpackfile $unpackdir
    $file = "${env:temp}\afterburner\MSIAfterburnerSetup410.exe"
    Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
    Remove-Item $unpackdir -Recurse -Force
} catch {
    throw $_.Exception 
}
