$packageName   = 'miktex'
$Url = 'http://ftp.uni-erlangen.de/mirrors/CTAN/systems/win32/miktex/setup/basic-miktex.exe'
$Url64 = 'http://ftp.uni-erlangen.de/mirrors/CTAN/systems/win32/miktex/setup/basic-miktex-x64.exe'
$fileType = 'EXE'
$silentArgs = '--unattended --shared'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$install32 = Join-Path $scriptPath 'basic-miktex.exe'
$install64 = Join-Path $scriptPath 'basic-miktex-x64.exe'
$filePath = @{32=$install32;64=$install64}[(Get-ProcessorBits)]


# The package installer is very picky about its own file name and silent 
# installation. See for more information:
# https://github.com/AnthonyMastrean/chocolateypackages/issues/143#issuecomment-143379145
# 
# will be fixed when issue is resolved:
# https://github.com/chocolatey/choco/issues/435

Get-ChocolateyWebFile $packageName $filePath $Url $Url64

Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $filePath

Remove-Item $filePath -Force
