$ErrorActionPreference = 'Stop';
$packageName= 'windows-performance-toolkit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.microsoft.com/download/B/0/C/B0C80BA3-8AD6-4958-810B-6882485230B5/standalonesdk/sdksetup.exe' 


$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/Features OptionId.WindowsPerformanceToolkit /norestart /quiet /ceip off'
  url           = $url
}

Install-ChocolateyPackage @packageArgs