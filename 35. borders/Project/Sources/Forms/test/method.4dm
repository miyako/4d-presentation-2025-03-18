var $event : Object

$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		WParea:=ds:C1482.Documents.query("pageNumber == :1"; 2).first().comments
		
		OBJECT SET VALUE:C1742("WParea"; WParea)
		
End case 