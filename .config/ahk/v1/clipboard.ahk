^v:: ; Ctrl+V to show clipboard history
Menu, ClipBoardHistory, Add, Clipboard Item 1, Clip1
Menu, ClipBoardHistory, Add, Clipboard Item 2, Clip2
Menu, ClipBoardHistory, Add, Clipboard Item 3, Clip3
Menu, ClipBoardHistory, Show
return

Clip1:
Send, %ClipboardHistoryItem1%
return

Clip2:
Send, %ClipboardHistoryItem2%
return

Clip3:
Send, %ClipboardHistoryItem3%
return
