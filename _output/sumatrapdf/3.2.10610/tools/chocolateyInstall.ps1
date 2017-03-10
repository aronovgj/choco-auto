$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10610-64-install.exe' -Checksum fe33e7d0b859220f61cc1824a8be78fc00dbd818c7035148b9f91e4bff6f2e2c -ChecksumType 'sha256' -validExitCodes @(0)