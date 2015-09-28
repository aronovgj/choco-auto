$uninstall_keys = @(
 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
)

$uninstaller = $uninstall_keys `
  | ?{ Test-Path $_ } `
  | Get-ItemProperty `
  | ?{ $_.DisplayName -eq 'MiKTeX {{PackageVersion}}' } `
  | Select-Object -ExpandProperty UninstallString
  
Uninstall-ChocolateyPackage `
  -PackageName 'miktex' `
  -FileType 'EXE' `
  -SilentArgs '--unattended --shared' `
  -File $uninstaller
