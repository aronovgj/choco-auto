; For first install. When updating there is no Button1
WinWait, ahk_class #32770, , 300
ControlClick, Button1, ahk_class #32770

WinWait, ahk_class #32770, , 300
ControlClick, Button2, ahk_class #32770

WinWait, ahk_class #32770, , 300
ControlClick, Button2, ahk_class #32770

WinGetTitle, TitleName

; wait for button2 to become active
Loop {
     Sleep 200
     ControlGet bEnabled, Enabled,, Button2, %TitleName%
     If bEnabled
          Break
}
ControlClick, Button2, ahk_class #32770

