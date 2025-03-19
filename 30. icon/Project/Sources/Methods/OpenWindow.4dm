//%attributes = {}
#DECLARE($option : Object; $coord : Integer)

var $icon : Picture
Case of 
	: ($option.icon="User")
		$icon:=Form:C1466.userPict
	: ($option.icon="Product")
		$icon:=Form:C1466.productPict
	: ($option.icon="Building")
		$icon:=Form:C1466.buildingPict
	Else 
		// アイコンなし
End case 

var $file : 4D:C1709.File
Case of 
	: ($option.file="User")
		$file:=Form:C1466.userFile
	: ($option.file="Product")
		$file:=Form:C1466.productFile
	Else 
		// 紐付けファイルなし
End case 

$hWnd:=Open form window:C675($option.form; Plain form window:K39:10+Form has no menu bar:K39:18; $coord; $coord)
SET WINDOW TITLE:C213($option.title; $hWnd)

If ($option.file="None")
	SET WINDOW DOCUMENT ICON:C1840($hWnd; $icon)
Else 
	SET WINDOW DOCUMENT ICON:C1840($hWnd; $icon; $file)
End if 
DIALOG:C40($option.form; *)
Form:C1466.winCol.push($hWnd)