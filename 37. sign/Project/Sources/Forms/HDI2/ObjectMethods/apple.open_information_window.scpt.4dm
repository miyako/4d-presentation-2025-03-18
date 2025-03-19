If (FORM Event:C1606.code=On Clicked:K2:4)
	$file:=File:C1566("/DATA/signedDocument.4wp")
	If ($file.exists)
		$scpt:=File:C1566("/RESOURCES/open_information_window.scpt")
		$file:=OB Class:C1730($file).new($file.platformPath; fk platform path:K87:2)
		$scpt:=OB Class:C1730($scpt).new($scpt.platformPath; fk platform path:K87:2)
		SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_BLOCKING_EXTERNAL_PROCESS"; "false")
		LAUNCH EXTERNAL PROCESS:C811("osascript '"+$scpt.path+"' "+"'"+$file.path+"'")
	End if 
End if 