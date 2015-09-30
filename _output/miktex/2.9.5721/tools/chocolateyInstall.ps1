$packageName   = 'miktex'
$Url = 'http://ctan.math.washington.edu/tex-archive/systems/win32/miktex/setup/basic-miktex-2.9.5721.exe'
$Url64 = 'http://ctan.math.washington.edu/tex-archive/systems/win32/miktex/setup/basic-miktex-2.9.5721-x64.exe'
$fileType = 'EXE'
$silentArgs = '--unattended --shared'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
	$filePath = Join-Path $scriptPath 'basic-miktex-2.9.5721-x64.exe'
}
else {
	$filePath = Join-Path $scriptPath 'basic-miktex-2.9.5721.exe'
}

Get-ChocolateyWebFile $packageName $filePath $Url $Url64

Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $filePath

Remove-Item $filePath -Force
