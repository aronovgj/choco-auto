$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$urlDesktop = '{{DownloadUrl}}'
$urlDesktopWin10 = '{{DownloadUrlx64}}'
$urlNotebook = '{{Checksum}}'
$urlNotebookWin10 = '{{Checksumx64}}'

function Get-GraphicsCardType {
  $cards = @(gwmi win32_VideoController)
  foreach ($card in $cards) {
    $name = $card.Name.Trim()
    if ($name -match 'NVIDIA') { break }
  }
  if ($name -match 'M(\s+LE|X)?$') {
    return 'notebook'
  } else {
    return 'desktop'
  }
}

$osBitness = Get-ProcessorBits
$osVersion = [Environment]::OSVersion.Version.Major
$cardType = Get-GraphicsCardType
$downloadVersion = 0

if ($osVersion -eq 10)        { $downloadVersion += 1 }
if ($cardType -eq 'notebook') { $downloadVersion += 2 }

switch ($downloadVersion){
  3 {$url = $urlNotebookWin10; break}
  2 {$url = $urlNotebook; break}
  1 {$url = $urlDesktopWin10; break}
  default {$url = $urlDesktop; break}
}

if ($osBitness -eq 64) {
  $url = $url.Replace('-32bit-', '-64bit-')
}

new-item "${env:temp}\nvidiadriver" -itemtype directory -Force
$unpackfile = "${env:temp}\nvidiadriver\nvidiadriver.zip"
$unpackdir = "${env:temp}\nvidiadriver"
Get-ChocolateyWebFile $packageName $unpackfile $url
Get-ChocolateyUnzip $unpackfile $unpackdir
$file = "${env:temp}\nvidiadriver\setup.exe"
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackdir -Recurse -Force
