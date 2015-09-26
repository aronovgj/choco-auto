$packageName   = 'miktex'
$Url = '{{DownloadUrl}}'
$Url64 = '{{DownloadUrlx64}}'
$fileType = 'EXE'
$silentArgs = '--unattended --shared'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
	$filePath = Join-Path $scriptPath 'basic-miktex-{{PackageVersion}}-x64.exe'
}
else {
	$filePath = Join-Path $scriptPath 'basic-miktex-{{PackageVersion}}.exe'
}

Get-ChocolateyWebFile $packageName $filePath $Url $Url64

Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $filePath