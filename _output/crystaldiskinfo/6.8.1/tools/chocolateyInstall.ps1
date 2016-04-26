$packageName = 'crystaldiskinfo'
$forward1 = 'http://crystalmark.info/redirect.php?product=CrystalDiskInfo'
$fileName = "DiskInfo.exe"
$linkName = "CrystalDiskInfo.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
 
Function Get-RedirectedUrl {
   Param ([Parameter(Mandatory=$true)][String]$url)
 
   $request = [System.Net.WebRequest]::Create($url)
   $request.AllowAutoRedirect=$true
 
   try {
      $response=$request.GetResponse()
      $response.ResponseUri.AbsoluteUri
      $response.Close()
   } catch {
      throw $_.Exception 
   }
}
$forward2 = Get-redirectedURL $forward1

$url = ((Invoke-WebRequest -Uri $forward1).Links | Where-Object {$_.href -like "/frs/redir.php*"} ).href[0] -replace 'amp;', ''

$url = 'http://osdn.jp' + $url

Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath