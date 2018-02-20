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

$url = Get-RedirectedURL http://mirrors.ctan.org/systems/win32/miktex/setup/miktex-portable-2.9.6521.exe

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = $packageName
  checksum      = '745a6fa16593cda188bda10dc0915d2343301b5b0e5ca5a4800cf02385ae48b3'
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