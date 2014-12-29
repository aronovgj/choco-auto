$packageName = 'evince'
$fileType = 'msi'
$silentArgs = '/quiet'
$url = 'ftp://ftp.gnome.org/pub/gnome/binaries/win32/evince/2.32/evince-2.32.0.145.msi' 
#update will fail if evince is on
$ProcessActive = Get-Process evince* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName evince*
}
Install-ChocolateyPackage $packageName $fileType $silentArgs $url
