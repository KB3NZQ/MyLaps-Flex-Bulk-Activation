#comments-start
By Michael Himmelstein
Email: himmelsmi@gmail.com
Script to automate filling in info for activating a lot of MyLaps Transponders
with out having to type the same info every time
To edit for your info replace the text "First name" "Last name" and "Email" leaving the Quote marks
Press the ESC key to stop the script or it will keep running untill you restart your computer
#comments-end

; Set Hot key to ESC to Kill the Script when we are done activating Transponders
HotKeySet("{ESC}", "Terminate")


Local $term = 0
While 1
	WinWaitActive ( "Registration" ) ;Wait till window opens
		ControlFocus ( "Registration","",1044) ; select first name
			Send ( "Scott" ) ;Text box = First name
			Send ( "{Tab}" ) ; tab to last name
		;ControlFocus ( "Registration","",1045) ;select last name
			Send ( "Roskovski" ) ;Text Box = Last Name
		;ControlFocus ( "Registration" ,"",1052) ;select email
			Send ( "{Tab}" ) ;tab to email
			Send ( "put your email address here" );Text box for your email address that you used when you registred the transponder to your account

			;Send the info to MyLaps and activate the Transponder;
			Send ( "{Enter}" )
	WinWaitClose ( "Registration" ) ;wait for window to close then go back wait till window opens
		Sleep(50) ;Slows down the script so it doesn't use too much CPU time
WEnd

Func Terminate() ;Die
    Exit 0 ;It's dead Jim... But it died with out any errors
EndFunc
