//%attributes = {}
#DECLARE($file : 4D:C1709.File; $privateKey : Text)->$result : Integer

var $fileHandle : 4D:C1709.FileHandle
var $key : 4D:C1709.CryptoKey

var $documentAsBlob; $blobSignature : Blob
var $documentSize : Integer
var $digest; $signature : Text

var $keyOptions; $signOptions : Object

If (Count parameters:C259<2)  // 秘密鍵が提供されていない場合
	
	If (ds:C1482.CryptoKey.all().length>0)
		$privateKey:=ds:C1482.CryptoKey.all().first().privateKey
		ok:=1
	Else 
		ALERT:C41("暗号鍵を先に生成してください")
		ok:=0
	End if 
	
Else 
	ok:=1
End if 


If (ok=1)
	
	// 署名を最後に追加するため、ドキュメントを読み書きモードで開きます
	$fileHandle:=$file.open("write")  // オフセット = 0
	$documentSize:=$fileHandle.getSize()
	
	// 秘密鍵に基づいて新しいキーを作成します
	$keyOptions:={type: "PEM"; pem: $privateKey}
	$key:=4D:C1709.CryptoKey.new($keyOptions)
	
	// ドキュメントを BLOB に読み込みます
	$documentAsBlob:=$fileHandle.readBlob($documentSize)
	
	// .sign() 関数を使って署名を生成します
	$signOptions:={hash: "SHA512"; encodingEncrypted: "Base64URL"}
	$signature:=$key.sign($documentAsBlob; $signOptions)  // 20R8 以上で sign() でBLOBがサポートされています
	
	// 署名の最後に "SIGN" を追加します
	$signature:=$signature+String:C10(Length:C16($signature); "000000")+"SIGN"  // 署名の最後の 10文字： "000789SIGN"
	
	// BLOB形式の署名をドキュメントの最後に追加します
	CONVERT FROM TEXT:C1011($signature; "UTF-8"; $blobSignature)
	
	$fileHandle.offset:=$documentSize
	$fileHandle.writeBlob($blobSignature)
	$fileHandle:=Null:C1517
	
End if 

$result:=ok