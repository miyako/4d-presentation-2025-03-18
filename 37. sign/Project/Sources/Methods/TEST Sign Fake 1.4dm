//%attributes = {}
#DECLARE($file : 4D:C1709.File; $privateKey : Text)

var $fileHandle : 4D:C1709.FileHandle
var $key : 4D:C1709.CryptoKey

var $documentAsBlob; $blobSignature : Blob
var $documentSize : Integer
var $digest; $signature : Text
var $keyOptions; $signOptions : Object
var $wp : Object


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
	
	// 署名用の digest を計算します
	$documentAsBlob:=$fileHandle.readBlob($documentSize)
	$digest:=Generate digest:C1147($documentAsBlob; SHA512 digest:K66:5)
	
	// 🔺🔺🔺 // digest 計算後にドキュメントを変更します
	$fileHandle:=Null:C1517
	$wp:=WP Import document:C1318($file)
	WP SET TEXT:C1574($wp; "x"; wk append:K81:179)
	WP EXPORT DOCUMENT:C1337($wp; $file)
	
	$fileHandle:=$file.open("write")  // オフセット = 0
	$documentSize:=$fileHandle.getSize()
	// 🔺🔺🔺  >
	
	
	// 秘密鍵に基づいて新しいキーを作成します
	$keyOptions:={type: "PEM"; pem: $privateKey}
	$key:=4D:C1709.CryptoKey.new($keyOptions)
	
	// .sign() 関数を使って署名を生成します
	$signOptions:={hash: "SHA512"; encodingEncrypted: "Base64URL"}
	$signature:=$key.sign($digest; $signOptions)
	
	// 署名の最後に "SIGN" を追加します
	$signature:=$signature+String:C10(Length:C16($signature); "000000")+"SIGN"  // 署名の最後の 10文字： "000789SIGN"
	
	// BLOB形式の署名をドキュメントの最後に追加します
	CONVERT FROM TEXT:C1011($signature; "UTF-8"; $blobSignature)
	
	$fileHandle.offset:=$documentSize
	$fileHandle.writeBlob($blobSignature)
	$fileHandle:=Null:C1517
	
End if 