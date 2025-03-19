//%attributes = {}
#DECLARE($document : Object)->$stats : Text

var $allPictures; $allSections; $allTextBoxes : Collection
var $section; $subSection : Object
var $subSectionsFirst; $subSectionsLR : Integer

$stats:=""

$allSections:=WP Get sections:C1580($document)
$allPictures:=WP Get elements:C1550($document; wk type image:K81:192)
$allTextBoxes:=WP Get elements:C1550($document; wk type text box:K81:372)

$subSectionsFirst:=0
$subSectionsLR:=0

For each ($section; $allSections)
	$subSection:=WP Get subsection:C1582($section; wk first page:K81:203)
	If ($subSection#Null:C1517)
		$subSectionsFirst+=1
	End if 
	$subSection:=WP Get subsection:C1582($section; wk right page:K81:205)
	If ($subSection#Null:C1517)
		$subSectionsLR+=1
	End if 
End for each 






If ($allSections.length<2)
	$stats+=String:C10($allSections.length)+" セクション\r"
Else 
	$stats+=String:C10($allSections.length)+" セクション\r"  //英語では複数形を表示するためにこの分岐が必要でした
End if 

If ($subSectionsFirst#0)
	If ($subSectionsFirst<2)
		$stats+=String:C10($subSectionsFirst)+" サブセクション (最初)\r"
	Else 
		$stats+=String:C10($subSectionsFirst)+" サブセクション (最初)\r"
	End if 
End if 

If ($subSectionsLR#0)
	If ($subSectionsLR<2)
		$stats+=String:C10($subSectionsLR)+" サブセクション (左/右)\r"
	Else 
		$stats+=String:C10($subSectionsLR)+" サブセクション (左/右)\r"
	End if 
End if 

If ($allPictures.length<2)
	$stats+=String:C10($allPictures.length)+" 画像\r"
Else 
	$stats+=String:C10($allPictures.length)+" 画像\r"
End if 
If ($allTextBoxes.length<2)
	$stats+=String:C10($allTextBoxes.length)+" テキストボックス\r"
Else 
	$stats+=String:C10($allTextBoxes.length)+" テキストボックス\r"
End if 
