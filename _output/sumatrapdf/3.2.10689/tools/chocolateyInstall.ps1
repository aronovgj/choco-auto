$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10689-64-install.exe' -Checksum c0356d95f109b74d69c64f5bbed753e54b93f55082e5e2af1dcfb859c663d198 -ChecksumType 'sha256' -validExitCodes @(0)