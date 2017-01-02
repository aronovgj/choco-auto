$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10569-64-install.exe' -Checksum 9b583150e5c5e2c263b9cd27a063ca7852d1db7681ba82746121699e78a83329 -ChecksumType 'sha256' -validExitCodes @(0)