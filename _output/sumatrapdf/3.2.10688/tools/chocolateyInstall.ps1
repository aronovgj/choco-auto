$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10688-64-install.exe' -Checksum aa40543f5bb3a60146c5771eed384f76e39e30edf53da17ef8b82f49268b7474 -ChecksumType 'sha256' -validExitCodes @(0)