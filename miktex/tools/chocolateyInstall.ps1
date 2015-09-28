$id = 'miktex'

$tools = Split-Path -parent $MyInvocation.MyCommand.Definition

$install32 = Join-Path $tools 'basic-miktex-{{PackageVersion}}.exe'
$install64 = Join-Path $tools 'basic-miktex-{{PackageVersion}}-x64.exe'
$install = @{32=$install32;64=$install64}[(Get-ProcessorBits)]

# The package installer is very picky about its own file name and silent 
# installation. See for more information:
#
# https://github.com/AnthonyMastrean/chocolateypackages/issues/143#issuecomment-143379145
#
Get-ChocolateyWebFile `
	-PackageName $id `
	-FileFullPath $install `
	-Url '{{DownloadUrl}}' `
	-Url64 '{{DownloadUrlx64}}' `
	-Checksum '{{Checksum}}' `
	-Checksum64 '{{Checksum64}}'

Install-ChocolateyInstallPackage `
	-PackageName $id `
	-FileType 'EXE' `
	-SilentArgs '--unattended --shared' `
	-File $install
