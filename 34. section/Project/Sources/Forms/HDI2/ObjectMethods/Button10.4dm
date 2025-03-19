var $subSection : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$subSection:=WP Get subsection:C1582(WP Get section:C1581(Form:C1466.wp1; 1); wk left page:K81:204)
WP RESET ATTRIBUTES:C1344($subSection)  // 属性名の指定は必要はありません