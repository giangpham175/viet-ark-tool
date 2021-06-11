;;;		 add more feature (step by step)
;================================================================================================;
;;   add feature name in GUICtrlSetData under $lstMode

;;   Case $btnReady :
;	  ElseIf ($selectedItemText = "feature name") Then
;		 ToolTip($textInBtnReady & @CRLF & "...", 0, 0)

;;   Case $lstMode :
;	  ElseIf ($selectedItemText = "feature name") Then
;		 $text... = @TAB & "MODE ..." & @CRLF & "" & @CRLF & "..." & @CRLF & $selectedItemText
;		 GUICtrlSetData($edtDescription, $text...)

;;   _start():
;	  ElseIf ($selectedItemText = "feature name") Then
;		 ToolTip($textInF2Key & @CRLF & "...", 0, 0)
;		 start...()

;;   start...()
;	  Func start...()
;		 $fInterrupt = 0
;		 While 1
;			If $fInterrupt <> 0 Then
;			   ConsoleWrite("Stop " & $selectedItemText & @CRLF)
;			   Return
;			EndIf
;
;		 WEnd
;	  EndFunc
;================================================================================================;

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ###
$Form1 = GUICreate("VietARK", 856, 628, 700, 185)
$Group1 = GUICtrlCreateGroup("VietARK - Controller", 8, 8, 273, 585)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$btnFacebook = GUICtrlCreateButton("Facebook", 23, 512, 241, 33)
GUICtrlSetCursor (-1, 0)
$btnDiscord = GUICtrlCreateButton("Discord", 23, 552, 241, 33)
GUICtrlSetCursor (-1, 0)
$Label1 = GUICtrlCreateLabel("Viet ARK", 83, 128, 126, 36)
GUICtrlSetFont(-1, 20, 800, 2, "Lucida Bright")
$lstMode = GUICtrlCreateList("", 23, 192, 241, 294, BitOR($WS_BORDER, $WS_VSCROLL))
GUICtrlSetData(-1, "metal run|spam join server|snow owl|coming soon 1|coming soon 2|coming soon 3|coming soon 4|coming soon 5|coming soon 6|coming soon 7|coming soon 8|coming soon 9|coming soon 10")
GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel("Choose mode:", 25, 168, 84, 17)
$Icon1 = GUICtrlCreateIcon(@ScriptDir&"\asset\vietark.ico", -1, 104, 40, 81, 81)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("VietARK - Description", 304, 8, 545, 585)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$edtDescription = GUICtrlCreateEdit("", 312, 24, 529, 425)
GUICtrlSetData(-1, "Welcome to VietARK.")
GUICtrlSetFont(-1, 15, 400, 0, "MS Sans Serif")
$btnReady = GUICtrlCreateButton("Ready", 312, 552, 150, 33)
GUICtrlSetCursor (-1, 0)
$btnClose = GUICtrlCreateButton("Close", 695, 552, 150, 33)
GUICtrlSetCursor (-1, 0)
$Label3 = GUICtrlCreateLabel("made by heodat", 519, 560, 124, 20)
GUICtrlSetFont(-1, 10, 800, 4, "MS Sans Serif")
$Label4 = GUICtrlCreateLabel("Remember this key:", 312, 480, 194, 29)
GUICtrlSetFont(-1, 15, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Label5 = GUICtrlCreateLabel("F2  to Start", 544, 456, 78, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label6 = GUICtrlCreateLabel("F3  to Pause / Resume (not supprted yet)", 544, 488, 285, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label7 = GUICtrlCreateLabel("F4  to Stop", 544, 520, 78, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label8 = GUICtrlCreateLabel("Thanks for the support from PXC, HC and friends", 272, 600, 328, 20)
GUICtrlSetFont(-1, 10, 400, 2, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

HotKeySet("{F4}", "_Interrupt")
HotKeySet("{F2}", "_start")
$fInterrupt = 0
;$ok = False

While 1
   $nMsg = GUIGetMsg()
   $selectedItemText = _GUICtrlListBox_GetText($lstMode, _GUICtrlListBox_GetCurSel($lstMode))

   Switch $nMsg
	  Case $GUI_EVENT_CLOSE
		 Exit
	  Case $btnClose
		 Exit
	  Case $btnFacebook
		 ShellExecute("https://www.facebook.com/songsotgiuabaykhunglonganthit")
	  Case $btnDiscord
		 ShellExecute("https://discord.gg/gkYnuKB")


	  Case $btnReady
		 WinActivate("ARK: Survival Evolved")
		 $textInBtnReady = "VietARK - Thanks for choosing us"
		 If ($selectedItemText = "spam join server") Then
			ToolTip($textInBtnReady & @CRLF & "testing 1", 0, 0)
		 ElseIf ($selectedItemText = "metal run") Then
			ToolTip($textInBtnReady & @CRLF & "testing 2", 0, 0)

		 Else
			ToolTip($textInBtnReady, 0, 0)
		 EndIf


	  Case $lstMode
		 If ($selectedItemText = "spam join server") Then
			$text0 = @TAB & "SPAM JOINING SERVER" & @CRLF & "" & @CRLF & "- Made by VietARK" & @CRLF & "- Made by VietARK"
			GUICtrlSetData($edtDescription, $text0)
		 ElseIf ($selectedItemText = "metal run") Then
			$text1 = @TAB & "METAL RUN" & @CRLF & "" & @CRLF & "- Made by VietARK" & @CRLF & $selectedItemText
			GUICtrlSetData($edtDescription, $text1)

		 Else
			GUICtrlSetData($edtDescription, 'Welcome to VietARK.')
		 EndIf


   EndSwitch
WEnd

 Func _Interrupt()
     ToolTip("VietARK - Thanks for choosing us", 0, 0)
     $fInterrupt = 2
 EndFunc

Func _start()
   WinActivate("ARK: Survival Evolved")
   ;$ok = NOT $ok
   $textInF2Key = "VietARK - Thanks for choosing us"

   If ($selectedItemText = "spam join server") Then
	  ToolTip($textInF2Key & @CRLF & "testing 1", 0, 0)
	  start0()
   ElseIf ($selectedItemText = "metal run") Then
	  ToolTip($textInF2Key & @CRLF & "testing 2", 0, 0)
	  start1()

   Else
	  ToolTip($textInF2Key, 0, 0)
	  MsgBox(0, "VietARK", "No mode choosed")
   EndIf


EndFunc

Func start0()
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 ConsoleWrite("Stop " & $selectedItemText & @CRLF)
		 Return
	  EndIf

	  MouseClick('left', 92, 644)
	  Sleep(1000)
	  MouseClick('left', 1811, 73)
	  Sleep(1000)
   WEnd
EndFunc

Func start1()
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 ConsoleWrite("Stop " & $selectedItemText & @CRLF)
		 Return
	  EndIf

	  MouseClick('left', 108, 584)
	  Sleep(1000)
	  MouseClick('left', 952, 980)
	  Sleep(1000)
   WEnd
EndFunc
