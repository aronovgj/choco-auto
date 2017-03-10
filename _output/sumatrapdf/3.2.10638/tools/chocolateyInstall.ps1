$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10638-64-install.exe' -Checksum f21069a2bf7000d8de88a32698a69b5b7ab9c10d32f3875bd1f0a19147c30b03 -ChecksumType 'sha256' -validExitCodes @(0)