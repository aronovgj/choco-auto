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
Install-ChocolateyPackage $packageName $fileType $silentArgs $url -Checksum 04fe2776a98fe8bc0c73a685aabab26a29382336ebffb2c8073710d12e97f76c -ChecksumType 'sha256'
