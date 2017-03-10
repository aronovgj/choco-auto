$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10619-64-install.exe' -Checksum 78a7ac6a65f98e9951e7384865ae4e03abbf65cf8fa501396bcdf9eab9a30a07 -ChecksumType 'sha256' -validExitCodes @(0)