$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10686-64-install.exe' -Checksum 3c3b6ca250787533f8bfd53c860bdacc7d06f3db8abf09e167579fb98114cb68 -ChecksumType 'sha256' -validExitCodes @(0)