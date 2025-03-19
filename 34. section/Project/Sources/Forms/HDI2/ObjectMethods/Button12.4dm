If (Form:C1466.trace)
	TRACE:C157
End if 

Try
	WP DELETE SUBSECTION:C1584(WP Get section:C1581(Form:C1466.wp1; 1); wk first page:K81:203)
Catch
	ALERT:C41("There is no \"first page\" subsection in the section !")
End try

Form:C1466.action:="calcStats"
SET TIMER:C645(-1)