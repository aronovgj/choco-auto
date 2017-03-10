$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10607-64-install.exe' -Checksum 9447e01d0db560b357afa8ae59a10b1a4c19f59b172fd1fbacf98c636a397b43 -ChecksumType 'sha256' -validExitCodes @(0)