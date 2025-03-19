var $section : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$section:=WP Get section:C1581(Form:C1466.wp1; 2)
If ($section#Null:C1517)
	
	// 2つのシンタックスが利用できます : 
	
	//WP DELETE SECTION(form.wp1; 2)
	//WP DELETE SECTION($section)
	
	WP DELETE SECTION:C1842($section)
Else 
	ALERT:C41("セクション 2 は存在しません")
End if 

Form:C1466.action:="calcStats"
SET TIMER:C645(-1)