$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10621-64-install.exe' -Checksum a65966f8b5fbd529e5622f5d47495a526f2d08b3509bb8b5f9e9d5457469d2fe -ChecksumType 'sha256' -validExitCodes @(0)