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
#include <Misc.au3>

#Region ### START Koda GUI section ###
$Form1 = GUICreate("VietARK", 856, 628, 516, 181)
$Group1 = GUICtrlCreateGroup("VietARK - Controller", 8, 8, 273, 585)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$btnFacebook = GUICtrlCreateButton("Facebook", 23, 512, 241, 33)
GUICtrlSetCursor (-1, 0)
$btnDiscord = GUICtrlCreateButton("Discord", 23, 552, 241, 33)
GUICtrlSetCursor (-1, 0)
$Label1 = GUICtrlCreateLabel("Viet ARK", 83, 128, 126, 36)
GUICtrlSetFont(-1, 20, 800, 2, "Lucida Bright")
$lstMode = GUICtrlCreateList("", 23, 192, 241, 294, BitOR($WS_BORDER, $WS_VSCROLL))
GUICtrlSetData(-1, "take berries|gasoline separation|anti afk|hack feces|drop items|drop items (advanced)|coming soon 4|coming soon 5|coming soon 6|coming soon 7|coming soon 8|coming soon 9|coming soon 10")
GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel("Choose mode:", 25, 168, 84, 17)
$Icon1 = GUICtrlCreateIcon(@ScriptDir&"\asset\vietark.ico", -1, 104, 40, 81, 81)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("VietARK - Description", 304, 8, 545, 585)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$edtDescription = GUICtrlCreateEdit("", 312, 24, 529, 425, $ES_READONLY)
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

HotKeySet("{F2}", "_start")
HotKeySet("{F4}", "_Interrupt")

HotKeySet("{F5}", "_auto_Click")
HotKeySet("{F6}", "_auto_Walk")
;HotKeySet("{F7}", "_auto_Run")
HotKeySet("{F8}", "_auto_Spam_E")
HotKeySet("{F9}", "_auto_Spam_F")

$ark = WinWait("ARK: Survival Evolved")
$fInterrupt = 0
$timeToChat = 0
$timeToEat = 0
$ok = False

While 1
   $nMsg = GUIGetMsg()
   $selectedItemText = _GUICtrlListBox_GetText($lstMode, _GUICtrlListBox_GetCurSel($lstMode))

   ;; F7 KeyPress : Auto Run
   If _IsPressed("76") Then
	  $fInterrupt = 0

	  $ok = NOT $ok
	  If $ok Then
		 If $fInterrupt <> 0 Then
			Return
		 EndIf
		 ToolTip("VietARK - Auto Run" & @CRLF & "F7 again to Stop", 0, 0)
		 Send("{SHIFTDOWN}{w down}")
	  Else
		 ToolTip("VietARK - Thanks for choosing us", 0, 0)
		 Send("{SHIFTUP}{w up}")
	  EndIf
	  While _IsPressed("76")
		 Sleep(250)
	  WEnd
   EndIf

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
		 $fInterrupt = 2
		 WinActivate("ARK: Survival Evolved")
		 $textInBtnReady = "VietARK - " & $selectedItemText
		 $textHotKeyInBtnReady = "F2: Start  -  F4: Stop"
		 $textCommonInBtnReady = $textInBtnReady & @CRLF & $textHotKeyInBtnReady

		 If ($selectedItemText = "take berries") Then
			ToolTip($textCommonInBtnReady, 0, 0)
		 ElseIf ($selectedItemText = "gasoline separation") Then
			ToolTip($textCommonInBtnReady, 0, 0)
		 ElseIf ($selectedItemText = "anti afk") Then
			ToolTip($textCommonInBtnReady, 0, 0)
		 ElseIf ($selectedItemText = "hack feces") Then
			ToolTip($textCommonInBtnReady, 0, 0)
		 ElseIf ($selectedItemText = "drop items") Then
			ToolTip($textCommonInBtnReady, 0, 0)
		 ElseIf ($selectedItemText = "drop items (advanced)") Then
			ToolTip($textCommonInBtnReady, 0, 0)

		 Else
			ToolTip($textInBtnReady, 0, 0)
		 EndIf


	  Case $lstMode
		 If ($selectedItemText = "take berries") Then
			$text0 = "TAKE BERRIES"
			$text0L1 = "- Required settings: 1920x1080-WindowsFullScreen"
			$text0L2 = "- Disable Menu Transitions"
			$text0L3 = "- Put feces in your inventory, look at the pot to get it"
			$text0Final = @TAB & $text0 & @CRLF & @CRLF & $text0L1 & @CRLF & $text0L2 & @CRLF & @CRLF & $text0L3
			GUICtrlSetData($edtDescription, $text0Final)

		 ElseIf ($selectedItemText = "gasoline separation") Then
			$text1 = "GASOLINE SEPARATION"
			$text1L1 = "- Required settings: 1920x1080-WindowsFullScreen"
			$text1L2 = "- Disable Menu Transitions"
			$text1L3 = "- This feature will split 10 slots 10 gas"
			$text1L4 = "- Put gasoline in your inventory, keep inventory open"
			$text1LFinal = @TAB & $text1 & @CRLF & @CRLF & $text1L1 & @CRLF & $text1L2 & @CRLF & $text1L3 & @CRLF & @CRLF & $text1L4
			GUICtrlSetData($edtDescription, $text1LFinal)

		 ElseIf ($selectedItemText = "anti afk") Then
			$text2 = "ANTI AFK"
			$text2L1 = "- Prepare a straight distance of about 7 to 10 units, and that place is safe"
			$text2L2 = "- Put food & water into slot 1 & 2"
			$text2L3 = "- This feature will do eat and drink every hour"
			$text2LFinal = @TAB & $text2 & @CRLF & @CRLF & $text2L1 & @CRLF & $text2L2 & @CRLF & $text2L3
			GUICtrlSetData($edtDescription, $text2LFinal)

		 ElseIf ($selectedItemText = "hack feces") Then
			$text3 = "HACK FECES"
			$text3L1 = "- Required settings: 1920x1080-WindowsFullScreen"
			$text3L2 = "- Disable Menu Transitions"
			$text3L3 = "- Wait for the food to turn gray, then sit on the toilet"
			$text3LFinal = @TAB & $text3 & @CRLF & @CRLF & $text3L1 & @CRLF & $text3L2 & @CRLF & @CRLF & $text3L3
			GUICtrlSetData($edtDescription, $text3LFinal)

		 ElseIf ($selectedItemText = "drop items") Then
			$text4 = "DROP ITEMS"
			$text4L1 = "- Required settings: 1920x1080-WindowsFullScreen"
			$text4L2 = "- Disable Menu Transitions"
			$text4L3 = "- Press F to open vault you need drop"
			$text4LFinal = @TAB & $text4 & @CRLF & @CRLF & $text4L1 & @CRLF & $text4L2 & @CRLF & @CRLF & $text4L3
			GUICtrlSetData($edtDescription, $text4LFinal)

		 ElseIf ($selectedItemText = "drop items (advanced)") Then
			$text5 = "DROP ITEMS (ADVANCED)"
			$text5L1 = "** This feature only works when you open the vault in a sitting position"
			$text5L2 = "- Required settings: 1920x1080-WindowsFullScreen"
			$text5L3 = "- Disable Menu Transitions"
			$text5L4 = "- Put 1 item that you are willing to give it up in your inventory (ex: 1 thatch, 1 wood, ....)"
			$text5L5 = "- Sit (press C) and press F to open vault you need drop"
			$text5LFinal = @TAB & $text5 & @CRLF & @CRLF & $text5L1 & @CRLF & @CRLF & $text5L2 & @CRLF & $text5L3 & @CRLF & @CRLF & $text5L4 & @CRLF & $text5L5
			GUICtrlSetData($edtDescription, $text5LFinal)

		 Else
			GUICtrlSetData($edtDescription, 'Welcome to VietARK.')
		 EndIf


   EndSwitch
WEnd

Func _Interrupt()
   ToolTip("VietARK - Thanks for choosing us", 0, 0)
   $fInterrupt = 2
EndFunc

Func _auto_Click()
   ToolTip("VietARK - Auto Click" & @CRLF & "F4 to Stop", 0, 0)
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 Return
	  EndIf

	  ControlClick($ark, "", "", "left")
   WEnd
EndFunc

Func _auto_Walk()
   ToolTip("VietARK - Auto Walk" & @CRLF & "F4 to Stop", 0, 0)
   WinActivate("ARK: Survival Evolved")
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 Return
	  EndIf

	  Send("{w down}")
	  Sleep(2000)
	  Send("{w up}")
   WEnd
EndFunc

;Func _auto_Run()
;EndFunc

Func _auto_Spam_E()
   ToolTip("VietARK - Auto Spam E" & @CRLF & "F4 to Stop", 0, 0)
   WinActivate("ARK: Survival Evolved")
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 Return
	  EndIf

	  Send("{e}")
   WEnd
EndFunc

Func _auto_Spam_F()
   ToolTip("VietARK - Auto Spam F" & @CRLF & "F4 to Stop", 0, 0)
   WinActivate("ARK: Survival Evolved")
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 Return
	  EndIf

	  Send("{f}")
   WEnd
EndFunc

Func _start()
   WinActivate("ARK: Survival Evolved")
   ;$ok = NOT $ok
   $textInF2Key = "VietARK - " & $selectedItemText
   $textHotKeyInF2Key = "F2: Start  -  F4: Stop"
   $textCommonInF2Key = $textInF2Key & @CRLF & $textHotKeyInF2Key

   If ($selectedItemText = "") Then
	  startNoChoosed()

   ElseIf ($selectedItemText = "take berries") Then
	  ToolTip($textCommonInF2Key, 0, 0)
	  start0()

   ElseIf ($selectedItemText = "gasoline separation") Then
	  ToolTip($textCommonInF2Key, 0, 0)
	  start1()

   ElseIf ($selectedItemText = "anti afk") Then
	  ToolTip($textCommonInF2Key, 0, 0)
	  start2()

   ElseIf ($selectedItemText = "hack feces") Then
	  ToolTip($textCommonInF2Key, 0, 0)
	  start3()

   ElseIf ($selectedItemText = "drop items") Then
	  ToolTip($textCommonInF2Key, 0, 0)
	  start4()

   ElseIf ($selectedItemText = "drop items (advanced)") Then
	  ToolTip($textCommonInF2Key, 0, 0)
	  MouseClick("left", 407, 185, 1, 1)
	  Sleep(1000)
	  start5()

   Else
	  ToolTip($textInF2Key, 0, 0)
	  MsgBox(0, "VietARK", "No mode choosed")
   EndIf


EndFunc

Func startNoChoosed()
   ToolTip("VietARK - No mode choosed", 0, 0)
EndFunc

Func start0()
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 Return
	  EndIf

	  Sleep(100)
	  Send('{F}')
	  Sleep(1000)
	  MouseClick("left", 1480, 192, 1, 1)
	  Sleep(100)
	  MouseClick("left", 355, 185, 1, 1)
	  Sleep(100)
	  Send("{ESC}")
	  Sleep(100)
   WEnd
EndFunc

Func start1()
   For $i = 1 To 10
	  Sleep(100)
	  MouseClick("left", 267, 179, 2, 1)
	  Sleep(100)
	  Send("GASOLINE")
	  Sleep(100)
	  MouseClick("right", 163, 277, 1, 1)
	  Sleep(100)
	  MouseMove(157, 468, 0)
	  Sleep(100)
	  MouseMove(259, 545, 0)
	  Sleep(100)
	  MouseClick("left", 383, 547, 2, 1)
	  Sleep(100)
	  Send("10")
	  Sleep(100)
	  MouseClick("left", 365, 580, 1, 1)
   Next
EndFunc

Func start2()
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 Return
	  EndIf

	  Send("{w down}")
	  Sleep(5000)
	  Send("{w up}")
	  Sleep(300)

	  Send("{s down}")
	  Sleep(15000)
	  Send("{s up}")
	  Sleep(200)

	  ;20s 	~ 1
	  ;1hrs	~ 180

	  $timeToEat = $timeToEat + 1
	  $timeToChat = $timeToChat + 1

	  If($timeToChat = 20) Then
		 Send("{INS}")
		 Sleep(300)
		 Send("Tui dang treo game, ai thay thi ke tui nha ... :)))")
		 Sleep(100)
		 Send("{ENTER}")
		 Sleep(100)
		 $timeToChat = 0
	  EndIf

	  If($timeToEat = 180) Then
		 Send("{1}")
		 Sleep(300)
		 Send("{2}")
		 Sleep(200)
		 $temp = 0
	  EndIf
   WEnd
EndFunc

Func start3()
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 Return
	  EndIf

	  Send('{NUMPADADD}')
	  Sleep(1000)
	  Send('{f}')
	  Sleep(3000)
	  Local $TimFan = PixelSearch(1243, 233, 1337, 324, 0x8C8163, 10) ; T??m ?? ?????u ti??n trong toilet xem c?? ph??n kh??ng
	  ; M?? m??u SE : 0x97876A
	  ; M?? m??u CE : 0x8C8163
	  ; M?? m??u EX : 0x8C8163
	  If Not @error Then
		 MouseClick('', 960, 617)
		 Sleep(100)
		 Send('{ESC}')
		 Sleep(500)
	  Else
		 MsgBox(16, "Server Lag", 'T???m ng??ng do kh??ng t??m th???y ph??n' & @CRLF & "B???m n??t Flush x??? c???u, t???t inventory trong game" & @CRLF & "r???i m???i t???t b???ng n??y")
		 Sleep(100)
	  EndIf
   WEnd
EndFunc

Func start4()
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 Return
	  EndIf

	  Sleep(100)
	  MouseClick("left", 1424, 186, 1, 1)
	  Sleep(100)
	  MouseMove(250, 280, 1)
	  Sleep(100)
	  For $i = 1 To 5
		 Send("{o down}")
		 MouseMove(250, 280, 1)
		 MouseMove(350, 280, 1)
		 MouseMove(450, 280, 1)
		 MouseMove(550, 280, 1)
		 MouseMove(660, 280, 1)
		 MouseMove(160, 370, 1)
		 Send("{o up}")
	  Next
   WEnd
EndFunc

Func start5()
   $fInterrupt = 0
   While 1
	  If $fInterrupt <> 0 Then
		 Return
	  EndIf

	  Sleep(100)
	  MouseClick("left", 1424, 186, 1, 1)
	  Sleep(100)
	  MouseMove(250, 280, 1)
	  Sleep(100)
	  For $i = 1 To 5
		 Send("{o down}")
		 MouseMove(250, 280, 1)
		 MouseMove(350, 280, 1)
		 MouseMove(450, 280, 1)
		 MouseMove(550, 280, 1)
		 MouseMove(660, 280, 1)
		 MouseMove(160, 370, 1)
		 Send("{o up}")
	  Next

   WEnd
EndFunc