//%attributes = {}
Form:C1466.winCol:=New collection:C1472
var $hWnd : Integer

If (bTrace)
	TRACE:C157
End if 

// "Contact" フォームを開く
$hWnd:=Open form window:C675("Contact"; Plain form window:K39:10+Form has no menu bar:K39:18; 100; 100)
DIALOG:C40("Contact"; *)
Form:C1466.winCol.push($hWnd)

// タイトルバーに "user" アイコンを表示した "Contact" フォームを開く
$hWnd:=Open form window:C675("Contact"; Plain form window:K39:10+Form has no menu bar:K39:18; 100+40; 100+40)
SET WINDOW DOCUMENT ICON:C1840($hWnd; Form:C1466.userPict)
DIALOG:C40("Contact"; *)
Form:C1466.winCol.push($hWnd)

// "product" ドキュメントと紐づいた "Contact" フォームを開く
$hWnd:=Open form window:C675("Contact"; Plain form window:K39:10+Form has no menu bar:K39:18; 100+80; 100+80)
SET WINDOW DOCUMENT ICON:C1840($hWnd; Form:C1466.userFile)
DIALOG:C40("Contact"; *)
Form:C1466.winCol.push($hWnd)

// タイトルバーに "user" アイコンを表示し、"product" ドキュメントと紐づいた "Contact" フォームを開く
$hWnd:=Open form window:C675("Contact"; Plain form window:K39:10+Form has no menu bar:K39:18; 100+120; 100+120)
SET WINDOW DOCUMENT ICON:C1840($hWnd; Form:C1466.userPict; Form:C1466.userFile)
DIALOG:C40("Contact"; *)
Form:C1466.winCol.push($hWnd)




