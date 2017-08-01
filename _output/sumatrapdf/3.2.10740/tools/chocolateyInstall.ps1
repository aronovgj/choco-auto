$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10740-64-install.exe' -Checksum 07453e2b00c7eea5c49c131900cc4eb684bf5890633c58f6d3fa7619338449bc -ChecksumType 'sha256' -validExitCodes @(0)