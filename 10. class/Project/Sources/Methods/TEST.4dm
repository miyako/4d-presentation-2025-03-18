//%attributes = {}
var $person : cs:C1710.PersonEntity

If (ds:C1482.Person.getCount()=0)
	TRUNCATE TABLE:C1051([Person:1])
	SET DATABASE PARAMETER:C642([Person:1]; Table sequence number:K37:31; 0)
	$person:=ds:C1482.Person.new()
	$person.firstname:="keisuke"
	$person.lastname:="miyako"
	$person.save()
Else 
	$person:=ds:C1482.Person.all().first()
End if 

$window:=Open form window:C675("Person")
DIALOG:C40("Person"; $person)