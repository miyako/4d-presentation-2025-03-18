var $file : 4D:C1709.File
var $filePath : Text
var $result : Integer

$file:=File:C1566("/DATA/signedDocument.4wp")
$filePath:=$file.platformPath
WP EXPORT DOCUMENT:C1337(Form:C1466.wp2; $filePath; wk 4wp:K81:4)  // $file は 20R8 以上でサポートされています

If (Form:C1466.trace)
	TRACE:C157
End if 

//SAFE Sign Document two($file)  // available only staring with 4D 20 R8
$result:=SAFE Sign Document($file)

If ($result=1)
	ALERT:C41("ドキュメントを保存して署名しました")
End if 