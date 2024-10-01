^!s:: ; Ctrl+Alt+S to start screen capture
MouseGetPos, x1, y1
MouseClickDrag, left, x1, y1, x2, y2
Send, {PrintScreen}
return