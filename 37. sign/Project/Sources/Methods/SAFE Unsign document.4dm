//%attributes = {}
#DECLARE($file : 4D:C1709.File)->$result : Integer

var $fileHandle : 4D:C1709.FileHandle

var $documentSize : Integer
var $blobSignature : Blob
var $textSignature : Text
var $length : Integer

$fileHandle:=$file.open("write")  // オフセット = 0
$documentSize:=$fileHandle.getSize()

// 最後の 4バイトを読みとります
$fileHandle.offset:=$documentSize-4  // "SIGN" かどうかを確認します
$blobSignature:=$fileHandle.readBlob(4)
$textSignature:=Convert to text:C1012($blobSignature; "UTF-8")

If ($textSignature="SIGN")
	
	// その前の 6バイトも読みとります
	$fileHandle.offset:=$documentSize-10  // "000999SIGN"
	$blobSignature:=$fileHandle.readBlob(6)  // SIGN を除外した 6文字
	$textSignature:=Convert to text:C1012($blobSignature; "UTF-8")
	
	$length:=Num:C11($textSignature)
	
	// ドキュメントの最後を切り捨てます (署名の長さ+10文字分)
	$fileHandle.setSize($documentSize-10-$length)
	
	$result:=1
	
Else 
	$result:=0  // 署名されていません
End if 
