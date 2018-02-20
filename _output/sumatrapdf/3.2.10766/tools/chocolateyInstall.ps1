$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10766-64-install.exe' -Checksum f845d981cee6492514deb117cfb4a5754aacab29bf51daeb9dda313f59825ec2 -ChecksumType 'sha256' -validExitCodes @(0)