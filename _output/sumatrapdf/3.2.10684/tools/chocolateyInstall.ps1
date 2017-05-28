$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10684-64-install.exe' -Checksum 895b32280711c81013163a265b6a8c30ad2e1e2cbada697d2af5f19a26648c6b -ChecksumType 'sha256' -validExitCodes @(0)