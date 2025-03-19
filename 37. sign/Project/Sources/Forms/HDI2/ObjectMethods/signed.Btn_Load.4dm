var $file : 4D:C1709.File
var $result : Integer

$file:=File:C1566("/DATA/signedDocument.4wp")

If (Form:C1466.trace)
	TRACE:C157
End if 

//$result:=SAFE Check signature two($file)  // $file は 20R8 以上でサポートされています
$result:=SAFE Check signature($file)

Case of 
	: ($result=1)
		ALERT:C41("GOOD:\r\rドキュメントは署名されていて、改変されていません。\r\r安全に読み込むことができます。")
	: ($result=0)
		ALERT:C41("Warning!\r\rドキュメントは署名されていません。\r\r安全でない可能性があります。")
	: ($result=-1)
		ALERT:C41("DANGER!\r\rドキュメントは署名されていますが、問題があります。\r\r改変されているようです。")
	: ($result=-2)
		ALERT:C41("暗号鍵を先に生成してください")
End case 