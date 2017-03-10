$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10605-64-install.exe' -Checksum b4f2d38874b11852d20133e7675bbbcb18677a20d5fd90edc191af49dd822791 -ChecksumType 'sha256' -validExitCodes @(0)