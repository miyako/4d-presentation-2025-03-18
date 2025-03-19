var $section : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$section:=WP Get section:C1581(Form:C1466.wp1; 1)
WP RESET ATTRIBUTES:C1344($section)  // 属性名の指定は必要はありません

Form:C1466.action:="calcStats"
SET TIMER:C645(-1)