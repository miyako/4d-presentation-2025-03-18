C_TEXT:C284($path)
C_LONGINT:C283($page)
C_PICTURE:C286($pict)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.documents:=ds:C1482.Documents.all().orderBy("pageNumber")
		
		Form:C1466.tabControl:=New object:C1471
		Form:C1466.tabControl.values:=Form:C1466.documents.toCollection("title").extract("title")
		Form:C1466.tabControl.index:=0
		
		Form:C1466.wp1:=Form:C1466.documents[0].comments
		Form:C1466.wp2:=Form:C1466.documents[0].sample
		
		Form:C1466.trace:=False:C215
		
		OBJECT SET VISIBLE:C603(*; "apple.@"; Is macOS:C1572)
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		$page:=FORM Get current page:C276
		
		Form:C1466.wp1:=Form:C1466.documents[$page-1].comments
		Form:C1466.wp2:=Form:C1466.documents[$page-1].sample
		
End case 

If ([On Load:K2:1; On Clicked:K2:4].indexOf(FORM Event:C1606.code)#-1)
	If (Is macOS:C1572)
		OBJECT SET ENABLED:C1123(*; "apple.@"; File:C1566("/DATA/signedDocument.4wp").exists)
	End if 
	OBJECT SET ENABLED:C1123(*; "signed.@"; File:C1566("/DATA/signedDocument.4wp").exists)
End if 

