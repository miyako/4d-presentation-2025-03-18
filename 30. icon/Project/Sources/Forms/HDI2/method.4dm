Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		var bTrace : Boolean:=False:C215
		
		Form:C1466.winCol:=New collection:C1472
		
		Form:C1466.option:=New collection:C1472
		Form:C1466.option.push({form: "Contact"; title: "Contacts1"; icon: "None"; file: "None"})
		Form:C1466.option.push({form: "Contact"; title: "Contacts2"; icon: "User"; file: "None"})
		Form:C1466.option.push({form: "Contact"; title: "Contacts3"; icon: "User"; file: "User"})
		Form:C1466.option.push({form: "Product"; title: "Products1"; icon: "Product"; file: "Product"})
		Form:C1466.option.push({form: "Product"; title: "Products2"; icon: "Building"; file: "None"})
		Form:C1466.option.push({form: "Product"; title: "Products3"; icon: "None"; file: "Product"})
		
		// アイコン画像の読み込み
		var $image : Picture
		READ PICTURE FILE:C678(File:C1566("/RESOURCES/icon/user.png").platformPath; $image)
		Form:C1466.userPict:=$image
		READ PICTURE FILE:C678(File:C1566("/RESOURCES/icon/box.png").platformPath; $image)
		Form:C1466.productPict:=$image
		READ PICTURE FILE:C678(File:C1566("/RESOURCES/icon/building.png").platformPath; $image)
		Form:C1466.buildingPict:=$image
		
		// ファイルパスの読み込み
		Form:C1466.userFile:=File:C1566("/RESOURCES/files/user.txt")
		Form:C1466.productFile:=File:C1566("/RESOURCES/files/product.txt")
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			CANCEL:C270
		End if 
		
End case 

