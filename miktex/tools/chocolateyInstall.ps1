param($first_flag, $usr_url, $usr_url64)
$packageName   = 'miktex'
$fileType = 'EXE'
$silentArgs = '--unattended --shared'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$install32 = Join-Path $scriptPath 'basic-miktex.exe'
$install64 = Join-Path $scriptPath 'basic-miktex-x64.exe'
$filePath = @{32=$install32;64=$install64}[(Get-ProcessorBits)]

Function Get-RedirectedUrl {
   Param ([Parameter(Mandatory=$true)][String]$url)

   $request = [System.Net.WebRequest]::Create($url)
   $request.AllowAutoRedirect=$false

   try {
      $response=$request.GetResponse()
      $response.Headers["Location"]
      $response.Close()
   } catch {
      throw $_.Exception
   }
}
# if no optional parameters are given retrieve the link from CTAN mirror
if ($PSBoundParameters.Keys.Count -eq 0)
{
$Url = Get-RedirectedURL http://mirrors.ctan.org/systems/win32/miktex/setup/basic-miktex.exe
$Url64 = Get-RedirectedURL http://mirrors.ctan.org/systems/win32/miktex/setup/basic-miktex-x64.exe
}
# Optional flag - for indicating a custom mirror from which to download MiKTeX.
# use the flag '--a' and afterwards write the url for x86 and then for x64 
elseif($PSBoundParameters.Keys.Count -eq 3 -And $PSBoundParameters["first_flag"] -eq '--a')
{
$Url = $PSBoundParameters["usr_url"]
$Url64 = $PSBoundParameters["usr_url64"]
}
else
{
   throw "IO Error: Input variables aren't in correct format." 
}


# The package installer is very picky about its own file name and silent 
# installation. See for more information:
# https://github.com/AnthonyMastrean/chocolateypackages/issues/143#issuecomment-143379145
# 
# will be fixed when issue is resolved:
# https://github.com/chocolatey/choco/issues/435

Get-ChocolateyWebFile $packageName $filePath $Url $Url64 -Checksum {{checksum}} -ChecksumType 'sha256' -Checksum64 {{checksumx64}} -ChecksumType64 'sha256'


Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $filePath

Remove-Item $filePath -Force

#add AutoInstall=1

[array]$key = Get-UninstallRegistryKey -SoftwareName "miktex*"
$uninstallPath = $key.UninstallString 
$installLocation = ($uninstallPath -Split("internal"))[0]
$installLocation = ($installLocation -Split("`""))[1]
$installLocation = $installLocation -replace '/','\'
$autoInstall = Join-Path $installLocation "initexmf.exe"
& $autoInstall --set-config-value=[MPM]AutoInstall=1 
