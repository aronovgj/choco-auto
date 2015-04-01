$packageName = 'rainmeter'
$url = 'https://github.com/rainmeter/rainmeter/releases/download/v3.2.0.2384/Rainmeter-3.2.exe'
$silentArgs = '/S /PORTABLE=0 /STARTUP=1'
$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
  $silentArgs = '/S /VERSION=64 /PORTABLE=0 /STARTUP=1'
}
$fileType = 'exe'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url


#copy msiafterburner.dll to plugins
$registryPath32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Rainmeter'
$registryPathWow6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Rainmeter'

if (Test-Path $registryPath32) {
	$registryPath = $registryPath32
}

if (Test-Path $registryPathWow6432) {
	$registryPath = $registryPathWow6432
}

if ($registryPath) {
	$uninstallString = (Get-ItemProperty -Path $registryPath -Name 'UninstallString').UninstallString
	$rainmeterDir = ($uninstallString -split '\\')[0..(($uninstallString -split '\\').count -2)] -join '\'
}
if (Test-Path $rainmeterDir){
	$destPath = Join-Path -path $rainmeterDir 'Plugins'
	$scriptFolder = (Split-Path -parent $MyInvocation.MyCommand.Definition)
	if ($osBitness -eq 64) {
		$dllFolder = Join-Path $scriptFolder 'MSIAfterburner64\MSIAfterburner.dll'
		Copy-Item $dllFolder $destPath 
	}
	if ($osBitness -eq 32) {
		$dllFolder = Join-Path $scriptFolder 'MSIAfterburner32\MSIAfterburner.dll'
		Copy-Item $dllFolder $destPath 
	}
}