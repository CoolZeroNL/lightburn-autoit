#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here


Func ActivateLightBurn()
	  If WinActive("[REGEXPTITLE:(?i)(.*- LightBurn*)]") Then ; Check if Notepad is currently active.
		  ConsoleWrite("_WinActive - LightBurn is active." & @CRLF)
	  Else
		  ConsoleWrite("_WinActive - LightBurn is NOT active." & @CRLF)

		  If WinActivate("[REGEXPTITLE:(?i)(.*- LightBurn.*)]", "") Then
			  ConsoleWrite("_WinActive - LightBurn NOW active." & @CRLF)
		  Else
			  MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Error", "Window not activated")
		  EndIf

	  EndIf
EndFunc   ;==>ActivateLightBurn