$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10683-64-install.exe' -Checksum dfbd904c3d9b3485bd663498c7fbc75cab04895bc2235e29ff6430fdd4dc076d -ChecksumType 'sha256' -validExitCodes @(0)