$packageName = 'miktex.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$linkName = "miktex-portable.lnk"

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

$url = Get-RedirectedURL http://mirrors.ctan.org/systems/win32/miktex/setup/miktex-portable-2.9.6236.exe

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = $packageName
  checksum      = 'a6a6f91aa942d7e40fa6cc4077b419e8cb18930823b84a7546317fc3d40ec207'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
$files = get-childitem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  #generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}

# start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $toolsDir 'texmfs'
$targetPath = Join-Path $targetPath 'install'
$targetPath = Join-Path $targetPath 'miktex'
$targetPath = Join-Path $targetPath 'bin'
$targetPath = Join-Path $targetPath 'miktex-taskbar-icon.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath