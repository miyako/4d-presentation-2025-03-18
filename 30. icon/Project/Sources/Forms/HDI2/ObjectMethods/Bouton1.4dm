
CloseWindows
Form:C1466.winCol:=New collection:C1472

var $x : Integer:=100
var $win : Object
For each ($win; Form:C1466.option)
	OpenWindow($win; $x)
	$x+=40
End for each 