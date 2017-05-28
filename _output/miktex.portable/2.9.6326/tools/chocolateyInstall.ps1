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

$url = Get-RedirectedURL http://mirrors.ctan.org/systems/win32/miktex/setup/miktex-portable-2.9.6326.exe

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = $packageName
  checksum      = 'c6337c1f46010f747b13d741f7b22554aeb10ad468cc37af6c7ecbebdd0db26c'
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