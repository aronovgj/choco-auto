$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10728-64-install.exe' -Checksum 2f09db5459fead16af2c2edf86a6956edaf6785b9e3884dc8f25ab8419ecef2f -ChecksumType 'sha256' -validExitCodes @(0)