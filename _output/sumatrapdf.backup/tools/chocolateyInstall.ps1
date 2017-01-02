$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' '{url}' -Checksum 87e76db93e3fa8b909d14ed6d093a1889bed98abc11c14c33715860b07886818 -ChecksumType 'sha256' -validExitCodes @(0)