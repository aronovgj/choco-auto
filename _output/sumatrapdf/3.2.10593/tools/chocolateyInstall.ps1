$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10593-64-install.exe' -Checksum 02abe7acaf05a74f7f870197e51dc454e407f4720d43b2f30cd536d38335c69f -ChecksumType 'sha256' -validExitCodes @(0)