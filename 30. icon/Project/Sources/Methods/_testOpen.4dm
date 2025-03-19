//%attributes = {}
If (Shift down:C543)
	$hWnd:=Open form window:C675("_testValidation"; Plain form window:K39:10)
	CALL WORKER:C1389("_test"; "_testValidation"; $hWnd; Form:C1466.text)
	DIALOG:C40("_testValidation")
Else 
	$hWnd:=Open form window:C675("_testValidation"; Movable form dialog box:K39:8)
	CALL WORKER:C1389("_test"; "_testValidation"; $hWnd; Form:C1466.text)
	DIALOG:C40("_testValidation")
End if 