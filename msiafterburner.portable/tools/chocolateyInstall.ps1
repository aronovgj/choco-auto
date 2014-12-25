$packageName = '{{PackageName}}'
new-item "${env:temp}\afterburner" -itemtype directory
$unpackfile = "${env:temp}\afterburner\afterburner.zip"
$unpackdir = "${env:temp}\afterburner"
$url = '{{DownloadUrl}}'
Get-ChocolateyWebFile $packageName $unpackfile $url

Get-ChocolateyUnzip $unpackfile $unpackdir

$file = "${env:temp}\afterburner\MSIAfterburnerSetup410.exe"



mkdir "${env:programfiles(x86)}\MSI Afterburner"
$destdir = "${env:programfiles(x86)}\MSI Afterburner"

& "${env:programfiles}\7-Zip\7z.exe" x -aoa $file "-o$destdir" "-xr!Profiles" "-x!MSIAfterburner.cfg"

Remove-Item $unpackdir -Recurse -Force
