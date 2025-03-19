Class extends Entity

local Function get fullname() : Text
	
	return [This:C1470.lastname; This:C1470.firstname].join(" "; ck ignore null or empty:K85:5)