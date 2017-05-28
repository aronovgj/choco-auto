$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10704-64-install.exe' -Checksum b442d58a27c92c44db7e4bd447314c2cb6a5b396af2e7c924d2f575f29d897f4 -ChecksumType 'sha256' -validExitCodes @(0)