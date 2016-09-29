$WindowsVersion = (Get-WmiObject -Class Win32_OperatingSystem).Caption
if ( $WindowsVersion -NotMatch 'Windows 10' ) {
	throw "Currently, auto-maintaining packages with more than two links is hard due to limited abilities of Ketarin. There are now two new packages: geforce-game-ready-driver-win7 and geforce-game-ready-driver-win10. The current package is deprecated and only dependent on geforce-game-ready-driver-win10. If you would like to install geforce-game-ready-driver-win7, please do so manually."
}

