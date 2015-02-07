; wait for uninstaller to start
sleep 5000
while (true)
{
	; if uninstaller is running kill everything that has to do with winhotkey. else it opens on its own and waits to be closed.
	Process, Exist, unins000.exe
	IF (!ErrorLevel= 0)
	{
	Process, Close, WinHotKey.exe
	Process, Close, WinHotKeyCfg.exe
	sleep, 1000
	}
	else 
	{
	return
	}
}