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

ToolTip("F6 = Frame!" & @CRLF & "F7 = Soft Reset!" & @CRLF & "F8 = Home!" & @CRLF & "F9 = Fire!" & @CRLF & "F10 = Exit!", @DesktopWidth - 110 , 50,"AutoIT is Active!")

While 1
   If _IsPressed("75", $hDLL) Then
	  ConsoleWrite("_IsPressed - F6 Key was pressed." & @CRLF)

	  ; Frame
	  _UIA_setVar("oUIElFrame","Title:=Frame;controltype:=UIA_ButtonControlTypeId;class:=QPushButton") ;
	  _UIA_action("oUIElFrame","click")

	  ; main (back to main, if not the numpad wont work.)
	  _UIA_setVar("oUIElement","Title:=;controltype:=UIA_GroupControlTypeId;class:=EditWindow") ;ControlType:=UIA_GroupControlTypeId;classname:=EditWindow")
	  _UIA_action("oUIElement","click")

    ElseIf _IsPressed("76", $hDLL) Then
	  ConsoleWrite("_IsPressed - F7 Key was pressed." & @CRLF)

	  ; Right Click Devices ( soft reset, reset axis )
	  _UIA_setVar("oUIElDevices","Title:=Devices;controltype:=UIA_ButtonControlTypeId;class:=QPushButton") ;
	  _UIA_action("oUIElDevices","rightclick")

	  ; main (back to main, if not the numpad wont work.)
	  _UIA_setVar("oUIElement","Title:=;controltype:=UIA_GroupControlTypeId;class:=EditWindow") ;ControlType:=UIA_GroupControlTypeId;classname:=EditWindow")
	  _UIA_action("oUIElement","click")

    ElseIf _IsPressed("77", $hDLL) Then
	  ConsoleWrite("_IsPressed - F8 Key was pressed." & @CRLF)

	  ; Home
	  Local $oP2=_UIA_getObjectByFindAll($UIA_oDesktop, "Title:=;controltype:=UIA_WindowControlTypeId;class:=MainWindow", $treescope_children)
	  Local $oP1=_UIA_getObjectByFindAll($oP2, "Title:=Laser;controltype:=UIA_WindowControlTypeId;class:=QDockWidget", $treescope_children)
	  Local $oP0=_UIA_getObjectByFindAll($oP1, "Title:=;controltype:=UIA_GroupControlTypeId;class:=QWidget", $treescope_children)
	  Local $oUIElement=_UIA_getObjectByFindAll($oP0, "title:=Home;ControlType:=UIA_ButtonControlTypeId", $treescope_subtree)
	  _UIA_action($oUIElement,"click")

    ElseIf _IsPressed("78", $hDLL) Then
	  ConsoleWrite("_IsPressed - F9 Key was pressed." & @CRLF)

	  ; Switch Tab to Move
	  _UIA_setVar("oUIElMove","Title:=Move;controltype:=8UIA_TabItemControlTypeId;class:=")
	  _UIA_action("oUIElMove","click")

	  ; Fire
	  _UIA_setVar("oUIElFire","Title:=Fire;controltype:=UIA_CheckBoxControlTypeId;class:=QPushButton")
	  _UIA_action("oUIElFire","click")

	  ; main (back to main, if not the numpad wont work.)
	  _UIA_setVar("oUIElement","Title:=;controltype:=UIA_GroupControlTypeId;class:=EditWindow") ;ControlType:=UIA_GroupControlTypeId;classname:=EditWindow")
	  _UIA_action("oUIElement","click")


    ElseIf _IsPressed("79", $hDLL) Then
        MsgBox($MB_SYSTEMMODAL, "_IsPressed", "The F10 Key was pressed, therefore we will close the application.")
        ExitLoop
    EndIf
    Sleep(100)
WEnd

DllClose($hDLL)