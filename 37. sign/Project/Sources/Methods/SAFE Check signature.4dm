//%attributes = {}
#DECLARE($file : 4D:C1709.File; $publicKey : Text)->$result : Integer

var $fileHandle : 4D:C1709.FileHandle
var $key : 4D:C1709.CryptoKey
var $documentSize : Integer
var $blobSignature; $documentAsBlob : Blob
var $textSignature; $digest : Text
var $length : Integer
var $signOptions; $keyOptions; $check : Object


$fileHandle:=$file.open("read")  // オフセット = 0
$documentSize:=$fileHandle.getSize()

// 最後の 4バイトを読みとります
$fileHandle.offset:=$documentSize-4  // "SIGN" かどうかを確認します
$blobSignature:=$fileHandle.readBlob(4)
$textSignature:=Convert to text:C1012($blobSignature; "UTF-8")

If ($textSignature="SIGN")
	
	If (Count parameters:C259<2)  // 公開鍵が提供されていない場合
		
		If (ds:C1482.CryptoKey.all().length>0)
			$publicKey:=ds:C1482.CryptoKey.all().first().publicKey
			ok:=1
		Else 
			ok:=0
		End if 
		
	Else 
		ok:=1
	End if 
	
	
	If (ok=1)
		
		// その前の 6バイトも読みとります
		$fileHandle.offset:=$documentSize-10  // "000999SIGN"
		$blobSignature:=$fileHandle.readBlob(6)
		$textSignature:=Convert to text:C1012($blobSignature; "UTF-8")
		$length:=Num:C11($textSignature)
		
		// 署名を読みとります
		$fileHandle.offset:=$documentSize-10-$length
		$blobSignature:=$fileHandle.readBlob($length)
		$textSignature:=Convert to text:C1012($blobSignature; "UTF-8")
		
		// 公開鍵に基づいて新しいキーを作成します
		$keyOptions:={type: "PEM"; pem: $publicKey}
		$key:=4D:C1709.CryptoKey.new($keyOptions)
		
		// ドキュメントを読み込みます (最後の署名以外)
		$fileHandle.offset:=0
		$documentAsBlob:=$fileHandle.readBlob($documentSize-10-$length)
		
		// .verify() 関数を使って署名を確認します
		$signOptions:={hash: "SHA512"; encodingEncrypted: "Base64URL"}
		$check:=$key.verify($documentAsBlob; $textSignature; $signOptions)  // 20R8 以上で verify() でBLOBがサポートされています
		
		
		If ($check.success)
			$result:=1
		Else 
			$result:=-1  // 不正なドキュメントです
		End if 
		
	Else 
		$result:=-2  // 暗号を確認するためのキーが存在しません
	End if 
	
Else 
	$result:=0  // 署名されていません
End if 