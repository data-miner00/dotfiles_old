; Display a message box
^0::MsgBox "Hello, world!"

; Maximize the current window
^1::WinMaximize "A"

; Expand acronyms
::rpa::Robotic Process Automation

; Run notepad
^3::Run "notepad"

; Run cmd
^q::Run A_ComSpec

; Open user documents folder
^2::Run A_MyDocuments

return
