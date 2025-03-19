//%attributes = {}
var $token:=File:C1566("/DATA/google_oauth_token.json")

If (False:C215)
	$token.delete()
End if 

var $credential:={}
$credential.name:="Google"
$credential.permission:="signedIn"
$credential.redirectURI:="http://127.0.0.1:50993/authorize/"
$credential.timeout:=60
$credential.accessType:="offline"
$credential.PKCEEnabled:=True:C214
$credential.authenticationPage:=Folder:C1567(fk resources folder:K87:11).file("authentication.html")
$credential.loginHint:="keisuke.miyako@4d.com"
$credential.prompt:="consent"

$credential.scope:=[\
"https://www.googleapis.com/auth/userinfo.email"; \
"https://www.googleapis.com/auth/userinfo.profile"].join(" ")

$credential.clientId:=Gmail client_id
$credential.clientSecret:=Gmail client_secret
var $oauth:=cs:C1710.NetKit.OAuth2Provider.new($credential)

If ($token.exists)
	$oauth.token:=JSON Parse:C1218($token.getText(); Is object:K8:27)  //from last time
End if 

var $google:=cs:C1710.NetKit.Google.new($oauth)

var $user:=$google.user.getCurrent(["names,photos"])
//https://developer.4d.com/4D-NetKit/#googleusergetcurrent
If ($user#Null:C1517)
	$token.setText(JSON Stringify:C1217($oauth.token; *))  //save for next time
	var $name : Text
	var $photo : Picture
	If ($user.names#Null:C1517) && ($user.names.length#0)
		$name:=$user.names[0].displayNameLastFirst
	End if 
	If ($user.photos#Null:C1517) && ($user.photos.length#0)
		Try(200=HTTP Get:C1157($user.photos[0].url; $photo))
		$window:=Open form window:C675("user")
		DIALOG:C40("user"; {name: $name; photo: $photo})
	End if 
End if 