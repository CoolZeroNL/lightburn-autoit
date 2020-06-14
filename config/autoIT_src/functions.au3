#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         CoolZero

#ce ----------------------------------------------------------------------------
#include <MsgBoxConstants.au3>

Func ActivateLightBurn()

	  ; this will make the window active.
	   If WinActivate("[REGEXPTITLE:(?i)(.*- LightBurn.*)]", "") Then
		   ConsoleWrite("_WinActive - LightBurn NOW active." & @CRLF)
	   Else
		   MsgBox($MB_SYSTEMMODAL, "Error", "No LightBurn Window found to be activated")
	   EndIf

EndFunc


Func ShowLightBurn()

   If WinActive("[REGEXPTITLE:(?i)(.*- LightBurn*)]") Then ; Check if Notepad is currently active.
	   ConsoleWrite("_WinActive - LightBurn is active." & @CRLF)
   Else
	   ConsoleWrite("_WinActive - LightBurn is NOT active." & @CRLF)

		 ; Restore LighBurn Window
		 Local $hwnd = WinGetHandle("[REGEXPTITLE:(?i)(.*- LightBurn*)]")
		 WinSetState ($hwnd, "", @SW_RESTORE)

		 ; active window to front..
		 ActivateLightBurn()
   EndIf

EndFunc   ;==>ActivateLightBurn

Func ActivateWorkplain()

   ; main (back to main, if not the numpad wont work.)
   _UIA_setVar("oUIElement","Title:=;controltype:=UIA_GroupControlTypeId;class:=EditWindow") ;ControlType:=UIA_GroupControlTypeId;classname:=EditWindow")
   _UIA_action("oUIElement","click")

EndFunc   ;==>


Func ActivateSoftReset()

   	  ; Right Click Devices ( soft reset, reset axis )
	  _UIA_setVar("oUIElDevices","Title:=Devices;controltype:=UIA_ButtonControlTypeId;class:=QPushButton") ;
	  _UIA_action("oUIElDevices","rightclick")

EndFunc   ;==>





































