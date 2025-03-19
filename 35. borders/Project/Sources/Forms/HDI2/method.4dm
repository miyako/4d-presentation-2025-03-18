C_TEXT:C284($path)
C_LONGINT:C283($page)
C_PICTURE:C286($pict)

var $index : Integer

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.documents:=ds:C1482.Documents.all().orderBy("pageNumber")
		
		Form:C1466.tabControl:=New object:C1471
		Form:C1466.tabControl.values:=ds:C1482.Documents.all().orderBy("pageNumber").toCollection("title").extract("title")
		Form:C1466.tabControl.index:=0
		
		//LISTBOX SELECT ROW(*; "LB"; 1)
		
		//WP SET VIEW PROPERTIES(WParea2; New object(wk formula highlight; wk never; wk formula highlight color; "LightYellow"; wk visible references; True; wk display formula as symbol; True))
		//Form.highlight:=False
		//Form.trace:=False
		
		//Form.displayValues:=1
		//Form.displayTemplate:=0
		
		Form:C1466.action:="gotoPage"
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		Form:C1466.action:="gotoPage"
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		Case of 
			: (Form:C1466.action="gotoPage")
				
				$index:=Form:C1466.tabControl.index
				FORM GOTO PAGE:C247($index+1)
				WParea1:=Form:C1466.documents[$index].comments
				
				//If ($index=1)
				//Form.action:="loadSample"
				//SET TIMER(-1)
				//End if 
				
				//: (Form.action="loadSample")
				
				//UpdateTemplateSample
				////FillContext("Fill")
				//Form.action:=""
				
		End case 
		
		//WP SET DATA CONTEXT(WParea2; New object("company"; Form.companies[0]))
		//WP COMPUTE FORMULAS(WParea2)
		
		
End case 
