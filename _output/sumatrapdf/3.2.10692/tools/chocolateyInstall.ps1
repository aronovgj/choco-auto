$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10692-64-install.exe' -Checksum acf54448172960d2be0dd6b1369ec1d387c7d9772d789c342ce13bfc463a5efb -ChecksumType 'sha256' -validExitCodes @(0)