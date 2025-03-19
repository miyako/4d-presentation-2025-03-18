If (Form:C1466.trace)
	TRACE:C157
End if 

Try
	WP DELETE SUBSECTION:C1584(WP Get section:C1581(Form:C1466.wp1; 1); wk left page:K81:204)  // または wk right page; 同じ結果になります
Catch
	ALERT:C41("セクション内に \"最初のページ\" サブセクションが存在しません")
End try

Form:C1466.action:="calcStats"
SET TIMER:C645(-1)
