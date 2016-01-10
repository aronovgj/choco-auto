$packageName = '{{PackageName}}'
$installerType = 'EXE'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) 

$registryPath32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\CPUID CPU-Z_is1'
$registryPathWow6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\CPUID CPU-Z_is1'

 
if (Test-Path $registryPath32) {
$registryPath = $registryPath32
}

if (Test-Path $registryPathWow6432) {
$registryPath = $registryPathWow6432
}

if ($registryPath) {
$uninstallString = (Get-ItemProperty -Path $registryPath -Name 'UninstallString').UninstallString
}

if ($uninstallString) {
Uninstall-ChocolateyPackage $packageName $installerType $silentArgs $uninstallString
}
