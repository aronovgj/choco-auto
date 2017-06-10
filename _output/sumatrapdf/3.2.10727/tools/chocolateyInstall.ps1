$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10727-64-install.exe' -Checksum c641b79f695a5f5c1c8a4b9b88721c085e8d42bcda3458b4dbfb6022e3145e4b -ChecksumType 'sha256' -validExitCodes @(0)