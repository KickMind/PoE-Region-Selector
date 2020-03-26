;Region Selector
;version 1.2.6 - march 2020

;Credits
;AHK-just-me for Class_ImageButton https://github.com/AHK-just-me/Class_ImageButton/
;RegionSearcher1.1.0 by Fall for original script "PoE Region Searcher Overlay 1.1.0" https://www.reddit.com/r/pathofexile/comments/fbdeqj/poe_region_searcher_overlay_110_sort_your_maps_by/

#NoEnv
SetWorkingDir %A_ScriptDir%
#WinActivateForce
#SingleInstance force

;buttons
SetBatchLines, -1
#Include Class_ImageButton.ahk
 
Hide1:=0
ThemeVariable:=0

; ----------------------------------------------------------------------------------------------------------------------
;*** Change to customize
WinName:="Region Selector"
SleepTime=200

KeyWidth=50
KeyHeightRegionName=34
KeyHeightDDL=20
 
ColumnsRegionName=8
ColumnsInfluence=8
ColumnsStones=8

; Edit here to change the order, regions appear in the menu
Array1:=[]
Array1[1,1]:="Glennach Cairns"
Array1[2,1]:="Tirn`'s End"
Array1[3,1]:="Lex Proxima"
Array1[4,1]:="Valdo`'s Rest"
Array1[5,1]:="New Vastir"
Array1[6,1]:="Haewark Hamlet"
Array1[7,1]:="Lex Ejoris"
Array1[8,1]:="Lira Arthain"
; ----------------------------------------------------------------------------------------------------------------------

Array1[1,2]:=Array1[1,1] . ".png"
Array1[2,2]:=Array1[2,1] . ".png"
Array1[3,2]:=Array1[3,1] . ".png"
Array1[4,2]:=Array1[4,1] . ".png"
Array1[5,2]:=Array1[5,1] . ".png"
Array1[6,2]:=Array1[6,1] . ".png"
Array1[7,2]:=Array1[7,1] . ".png"
Array1[8,2]:=Array1[8,1] . ".png"

Array1[1,3]:=Array1[1,1] . "2.png"
Array1[2,3]:=Array1[2,1] . "2.png"
Array1[3,3]:=Array1[3,1] . "2.png"
Array1[4,3]:=Array1[4,1] . "2.png"
Array1[5,3]:=Array1[5,1] . "2.png"
Array1[6,3]:=Array1[6,1] . "2.png"
Array1[7,3]:=Array1[7,1] . "2.png"
Array1[8,3]:=Array1[8,1] . "2.png"

;*** Create INI if not exist
ININame=%A_scriptdir%\Settings.ini
ifnotexist,%ININame%
    {
    IniWrite,F2,%ININame%,Options,ToggleKey
	IniWrite,0,%ININame%,Position,X
	IniWrite,0,%ININame%,Position,Y
    }
   
;*** Custom hotkey
Iniread, HotkeyVariable, %ININame%, Options, ToggleKey
Hotkey, %HotkeyVariable%,CustomHotkeyName,On

;*** Position
IniRead, XWind, %ININame%, Position, X
IniRead, YWind, %ININame%, Position, Y

;*** Title
IniRead, Title, %ININame%, Options, Title

;*** Transparency
IniRead, Trans, %ININame%, Options, Trans

;*** GUI layout
Gui, Color, 0x000010
Gui, Font, bold S10, Arial
Gui, Add, Text, cWhite BackgroundTrans vT1, %Title%
Gui, +LastFound -Caption -Border +ToolWindow
Gui, +AlwaysOnTop +Theme
WinSet, TransColor, 0x000010 %Trans%

Loop %ColumnsRegionName% {
    Col:=A_Index
	HotButtonVariable:=% Array1[A_Index,3]
	Gui, DummyGUI:Add, Pic, hwndHPIC, % Array1[A_Index,2]
	SendMessage, 0x0173, 0, 0, , ahk_id %HPIC% ; STM_GETIMAGE
	HPIC1 := ErrorLevel
    If Col=1
		Gui, Add, Button, vBT%A_Index% gKeyPressed%A_Index% w50 h34 y+5 hwndHBT%A_Index%
	Else
		Gui, Add, Button, vBT%A_Index% gKeyPressed%A_Index% w50 h34 x+5 yp hwndHBT%A_Index%
	Opt1 := [0, HPIC1]
	Opt2 := {2:HotButtonVariable}
	If !ImageButton.Create(HBT%A_Index%, Opt1, Opt2)
		MsgBox, 0, ImageButton Error Btn%A_Index%, % ImageButton.LastError
}
; *** Move icon - you can delete or comment next 2 lines if you dont want to see moving icon
Col=2
	Gui Add, Picture, x455 y35 h20 w20, move-ico.png

;*** Move with -Caption on
;https://autohotkey.com/board/topic/67766-moving-gui-with-caption/
OnMessage(0x0201, "WM_LBUTTONDOWN")
 
WM_LBUTTONDOWN()
{
   If (A_Gui)
      PostMessage, 0xA1, 2
; 0xA1: WM_NCLBUTTONDOWN, refer to http://msdn.microsoft.com/en-us/library/ms645620%28v=vs.85%29.aspx
; 2: HTCAPTION (in a title bar), refer to http://msdn.microsoft.com/en-us/library/ms645618%28v=vs.85%29.aspx
}

;*** Load
Loop %ColumnsInfluence% {
if (LoadInf%A_Index%)
   GuiControl, Choose, SelectedInfluence%A_Index%, % LoadInf%A_Index%
   Gui, Show,, %WinName%
}
 
Loop %ColumnsStones% {
if (LoadS%A_Index%)
   GuiControl, ChooseString, SelectedItem%A_Index%, % LoadS%A_Index%
   Gui, Show,, %WinName%
}

;*** Move window
SetTitleMatchMode, 1
WinMove, %WinName%,, %XWind%, %YWind%

Return ;prevents script auto KeyPressed1 searching when you open it
 
;*** Search
KeyPressed1:
    if WinExist("Path of Exile") {
        WinActivate
        }
    if WinActive("Path of Exile") {
	Sleep, SleepTime
	Send ^{SC021}
	Send ^{SC01E}
        SendInput % Array1[1,1]
        }
Return
 
KeyPressed2:
    if WinExist("Path of Exile") {
        WinActivate
        }
    if WinActive("Path of Exile") {
	Sleep, SleepTime
	Send ^{SC021}
	Send ^{SC01E}
        SendInput % Array1[2,1]
        }
Return
 
KeyPressed3:
    if WinExist("Path of Exile") {
        WinActivate
        }
    if WinActive("Path of Exile") {
	Sleep, SleepTime
	Send ^{SC021}
	Send ^{SC01E}
        SendInput % Array1[3,1]
        }
Return
 
KeyPressed4:
    if WinExist("Path of Exile") {
        WinActivate
        }
    if WinActive("Path of Exile") {
	Sleep, SleepTime
	Send ^{SC021}
	Send ^{SC01E}
        SendInput % Array1[4,1]
        }
Return
 
KeyPressed5:
    if WinExist("Path of Exile") {
        WinActivate
        }
    if WinActive("Path of Exile") {
	Sleep, SleepTime
	Send ^{SC021}
	Send ^{SC01E}
        SendInput % Array1[5,1]
        }
Return
 
KeyPressed6:
    if WinExist("Path of Exile") {
        WinActivate
        }
    if WinActive("Path of Exile") {
	Sleep, SleepTime
	Send ^{SC021}
	Send ^{SC01E}
        SendInput % Array1[6,1]
        }
Return
 
KeyPressed7:
    if WinExist("Path of Exile") {
        WinActivate
        }
    if WinActive("Path of Exile") {
	Sleep, SleepTime
	Send ^{SC021}
	Send ^{SC01E}
        SendInput % Array1[7,1]
        }
Return
 
KeyPressed8:
    if WinExist("Path of Exile") {
        WinActivate
        }
    if WinActive("Path of Exile") {
	Sleep, SleepTime
	Send ^{SC021}
	Send ^{SC01E}
        SendInput % Array1[8,1]
        }
Return
 
;*** Toggle GUI on button press
CustomHotkeyName:
    Hide1:=!Hide1
    If (Hide1)=1 {
		WinGetPos , XWind, YWind, WWind, HWind, %WinName%
		IniWrite,%XWind%,%ININame%,Position,X
		IniWrite,%YWind%,%ININame%,Position,Y
		Gui, Hide

    } Else {
	Gui, Show,, %WinName%
	}
Return
