#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start

#include <Misc.au3>
#include <MsgBoxConstants.au3>
#include "UIAWrappers.au3"

AutoItSetOption("MustDeclareVars", 1)

Local $hDLL = DllOpen("user32.dll")

ToolTip("F7 = Soft Reset!" & @CRLF & "F8 = Home!", 0, @DesktopHeight - 200,"AutoIT is Active!")

While 1
    If _IsPressed("76", $hDLL) Then
	  ConsoleWrite("_IsPressed - F7 Key was pressed." & @CRLF)

	  ; Right Click
	  _UIA_setVar("oUIElDevices","Title:=Devices;controltype:=UIA_ButtonControlTypeId;class:=QPushButton") ;
	  _UIA_action("oUIElDevices","rightclick")

    ElseIf _IsPressed("77", $hDLL) Then
	  ConsoleWrite("_IsPressed - F8 Key was pressed." & @CRLF)

	  ; Home
	  _UIA_setVar("oUIElHome","Title:=Home;controltype:=UIA_ButtonControlTypeId;class:=QPushButton") ;
	  _UIA_action("oUIElHome","click")

    ElseIf _IsPressed("1B", $hDLL) Then
        MsgBox($MB_SYSTEMMODAL, "_IsPressed", "The Esc Key was pressed, therefore we will close the application.")
        ExitLoop
    EndIf
    Sleep(100)
WEnd

DllClose($hDLL)