$packageName = 'msiafterburner'
$installerType = 'EXE'
$silentArgs = '/S'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$ahkFile = "$scriptPath\msiafterburneruninstall.ahk"
try {
    $ProcessActive = Get-Process MSIAfterburner* -ErrorAction SilentlyContinue
    if($ProcessActive -ne $null)
    {
        Stop-Process -ProcessName MSIAfterburner*
    }
    Start-Process 'AutoHotkey' $ahkFile
    if (Test-Path "${Env:ProgramFiles(x86)}\MSI Afterburner")
    {
    	$unpath = "${Env:ProgramFiles(x86)}\MSI Afterburner\Uninstall.exe"
    }
    else
    {
        $unpath = "${Env:ProgramFiles}\MSI Afterburner\Uninstall.exe"
    }
    Uninstall-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$unpath" -validExitCodes $validExitCodes
    } catch {
    throw $_.Exception 
    }
