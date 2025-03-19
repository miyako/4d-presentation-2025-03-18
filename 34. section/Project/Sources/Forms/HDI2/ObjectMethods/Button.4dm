var $section : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$section:=WP Get section:C1581(Form:C1466.wp1; 1)
// セクション1は常に存在します。セクション1しか存在しない場合は削除できません!

Try
	WP DELETE SECTION:C1842($section)
Catch
	ALERT:C41("残った最後のセクションは削除できません")
End try

Form:C1466.action:="calcStats"
SET TIMER:C645(-1)