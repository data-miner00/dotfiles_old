; Display a message box
^0::MsgBox "Hello, world!"

; Maximize the current window
^1::WinMaximize "A"

; Expand acronyms
::rpa::Robotic Process Automation

; Run notepad if not open
#n::
{
	if WinExist("ahk_class Notepad")
		WinActivate
	else
		Run "notepad"
}

; Run cmd
<^q::Run A_ComSpec

; Run cmd at C:\
>^q::Run "cmd", "C:\"

; Open user documents folder
^2::Run A_MyDocuments

return
