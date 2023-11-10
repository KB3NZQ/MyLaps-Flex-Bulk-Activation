#comments-start
By Michael Himmelstein
Email: himmelsmi@gmail.com
Script to automate filling in info for activating a lot of MyLaps Transponders
with out having to type the same info every time
To edit for your info replace the text "First name" "Last name" and "Email" leaving the Quote marks
Press the ESC key to stop the script or it will keep running untill you restart your computer
#comments-end

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=C:\Users\eScore8\Documents\GitHub\MyLaps-Flex-Bulk-Activation\gui-form-1.kxf
$_1 = GUICreate("GUI menu", 301, 377, 192, 125)
$idFileMenu = GUICtrlCreateMenu("&File")
$idSeparator1 = GUICtrlCreateMenuItem("", $idFileMenu)
$idExitItem = GUICtrlCreateMenuItem("Exit", $idFileMenu)
$idHelpMenu = GUICtrlCreateMenu("?")
$idAboutItem = GUICtrlCreateMenuItem("About", $idHelpMenu)
$idOkButton = GUICtrlCreateButton("OK", 42, 210, 70, 20)
$idCancelButton = GUICtrlCreateButton("Cancel", 164, 210, 70, 20)
$Reactivate = GUICtrlCreateCheckbox("Reactivate", 64, 16, 97, 17)
$ActivateNew = GUICtrlCreateCheckbox("Activate New", 64, 56, 97, 17)
$First = GUICtrlCreateInput("First", 64, 80, 129, 21)
$Last = GUICtrlCreateInput("Last", 63, 112, 129, 21)
$Email = GUICtrlCreateInput("Email", 62, 140, 129, 21)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd


Local $term = 0
Func $ActivateNew()
	While 1
		WinWaitActive ( "Registration" ) ;Wait till window opens
			ControlFocus ( "Registration","",1044) ; select first name
				Send ( $First ) ;Text box = First name
				Send ( "{Tab}" ) ; tab to last name
		;ControlFocus ( "Registration","",1045) ;select last name
				Send ( $last ) ;Text Box = Last Name
		;ControlFocus ( "Registration" ,"",1052) ;select email
				Send ( "{Tab}" ) ;tab to email
				Send ( $Email );Text box for your email address that you used when you registred the transponder to your account

			;Send the info to MyLaps and activate the Transponder;
				Send ( "{Enter}" )
		WinWaitClose ( "Registration" ) ;wait for window to close then go back wait till window opens
			Sleep(50) ;Slows down the script so it doesn't use too much CPU time
	WEnd
EndFunc
Func $Reactivate
	While 1
		WinActivate("FLEX Manager")
		ControlClick("FLEX Manager","", "[ID:1000]")
		Sleep(20000)

	WEnd
EndFunc
Func $idCancelButton()
        Exit
EndFunc   ;==>Terminate
;Func die() ;Die
 ;	Exit ;It's dead Jim... But it died with out any errors
;EndFunc   ;==>die
