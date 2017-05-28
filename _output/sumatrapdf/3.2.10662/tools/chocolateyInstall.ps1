$ProcessActive = Get-Process sumatraPDF* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName sumatraPDF*
}
Install-ChocolateyPackage 'sumatrapdf' 'exe' '/S' 'http://kjkpub.s3.amazonaws.com/sumatrapdf/prerel/SumatraPDF-prerelease-10662-64-install.exe' -Checksum 0ca5fd0a842a73dd5b272fa05ed6bc16cbf7a12b1855824bd8c399a4bc6a994d -ChecksumType 'sha256' -validExitCodes @(0)