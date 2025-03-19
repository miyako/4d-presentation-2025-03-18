C_TEXT:C284($path)
C_LONGINT:C283($page)
C_PICTURE:C286($pict)
ARRAY TEXT:C222($methods; 0)

var $index : Integer

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		APPEND TO ARRAY:C911($methods; "gotoPage")
		SET ALLOWED METHODS:C805($methods)
		
		Form:C1466.trace:=False:C215
		
		Form:C1466.documents:=ds:C1482.Documents.query("pageNumber !=0").orderBy("pageNumber")
		
		Form:C1466.tabControl:=New object:C1471
		Form:C1466.tabControl.values:=ds:C1482.Documents.query("pageNumber !=0").orderBy("pageNumber").toCollection("title").extract("title")
		Form:C1466.tabControl.index:=0
		
		FORM GOTO PAGE:C247(1)
		
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
				Form:C1466.wp1:=Form:C1466.documents[$index].sample
				Form:C1466.wp2:=Form:C1466.documents[$index].comments
				
				WP SET VIEW PROPERTIES:C1648(*; "WPareaLeft_2"; {zoom: 50})
				
				OBJECT SET VISIBLE:C603(*; "stats@"; ($index>0))  // == page >=1
				
				var $pZoom : Pointer
				$pZoom:=OBJECT Get pointer:C1124(Object named:K67:5; "zoom")
				$pZoom->:=Find in array:C230($pZoom->; "50%")
				
				Form:C1466.action:="calcStats"
				SET TIMER:C645(-1)
				
			: (Form:C1466.action="calcStats")
				Form:C1466.stats:=CalcStats(Form:C1466.wp1)
				
				
		End case 
		
		//WP SET DATA CONTEXT(form.wp2; New object("company"; Form.companies[0]))
		//WP COMPUTE FORMULAS(form.wp2)
		
		
End case 
