//%attributes = {}

#DECLARE($hWnd : Integer; $type : Text)

var $image; $emptyImage : Picture
READ PICTURE FILE:C678(File:C1566("/RESOURCES/icon/user.png").platformPath; $image)

var $file; $incorrectFile : 4D:C1709.File
$file:=File:C1566("/RESOURCES/files/user.txt")
$incorrectFile:=File:C1566("/RESOURCES/files/user2.txt")

var $folder; $incorrectFolder : 4D:C1709.Folder
$folder:=Folder:C1567("/RESOURCES/files")
$incorrectFolder:=Folder:C1567("/RESOURCES/files22")

Case of 
	: ($type="icon")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $image)
		
	: ($type="clear_image_file")
		SET WINDOW DOCUMENT ICON:C1840($hWnd)
		
	: ($type="emptyIcon")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $emptyImage)
		
	: ($type="file")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $file)
		
	: ($type="file_emptyIcon")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $emptyImage; $file)
		
	: ($type="file_icon")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $image; $file)
		
	: ($type="incorrectFile")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $incorrectFile)
		
	: ($type="icon_incorrectFile")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $image; $incorrectFile)
		
	: ($type="folder")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $folder)
		
	: ($type="folder_emptyIcon")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $emptyImage; $folder)
		
	: ($type="folder_icon")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $image; $folder)
		
	: ($type="incorrectFolder")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $incorrectFolder)
		
	: ($type="icon_incorrectFolder")
		SET WINDOW DOCUMENT ICON:C1840($hWnd; $image; $incorrectFolder)
		
End case 


