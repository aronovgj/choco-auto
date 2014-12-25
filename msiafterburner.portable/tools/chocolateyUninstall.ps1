$packageName = '{{PackageName}}'
$destdir = "${env:programfiles(x86)}\MSI Afterburner"
try {
if (Get-Process MSIAfterburner -ErrorAction silentlycontinue) {
  Stop-Process -ProcessName MSIAfterburner
}
Remove-Item $destdir -Recurse -Force
} catch {
Write-ChocolateyFailure $packageName $($_.Exception.Message)
throw
}
