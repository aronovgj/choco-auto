$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10701-64-install.exe' -Checksum 3d715ff2cfda8514d786d38980d0338ff37b9d20126c379d6ea381f93fe776d2 -ChecksumType 'sha256' -validExitCodes @(0)