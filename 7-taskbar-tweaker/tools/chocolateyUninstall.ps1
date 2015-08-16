$packageName = '{{PackageName}}'
$installerType = 'EXE'
$silentArgs = '/S'

$unpath = "$env:APPDATA\7+ Taskbar Tweaker\uninstall.exe"
Uninstall-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$unpath"
