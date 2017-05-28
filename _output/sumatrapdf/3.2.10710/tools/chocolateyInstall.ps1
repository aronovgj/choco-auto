$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10710-64-install.exe' -Checksum 69080ed8778277d919de161443f7d7ecaecdb6aec9711ce74f663f7002b9ed25 -ChecksumType 'sha256' -validExitCodes @(0)