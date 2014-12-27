$packageName = 'msiafterburner'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'http://download.msi.com/uti_exe/vga/MSIAfterburnerSetup410.zip'

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
    Write-ChocolateySuccess $packageName
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw 
}
