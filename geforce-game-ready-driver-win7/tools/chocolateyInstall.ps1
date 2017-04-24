$packageName = '{{PackageName}}'
$version = '{{PackageVersion}}'
$fileType = 'exe'
$silentArgs = '-s -noreboot -clean'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/{{PackageVersion}}/{{PackageVersion}}-desktop-win8-win7-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/{{PackageVersion}}/{{PackageVersion}}-desktop-win8-win7-64bit-international-whql.exe"

$params = "$env:chocolateyPackageParameters"
$params = (ConvertFrom-StringData $params.Replace(";", "`n")) 

function nogfe($params) {
    return ($params.nogfe -eq $true) 
}


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum {{checksum}} -ChecksumType 'sha256' -Checksum64 {{checksumx64}} -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
if (nogfe($params))
{
    Remove-Item $unpackDir\GFExperience -Recurse -Force
    Remove-Item $unpackDir\GFExperience.NvStreamSrv -Recurse -Force
    Remove-Item $unpackDir\GfExperienceService -Recurse -Force
}
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile -Recurse -Force
