

If (btnTrace)
	TRACE:C157
End if 



Case of 
	: (Form:C1466.small=1)
		Form:C1466.size:="small"
		
	: (Form:C1466.large=1)
		Form:C1466.size:="large"
		
End case 

Form:C1466.photoURL:=cs:C1710.URLBuilder.me.buildThumbnailURL(Form:C1466.product; Form:C1466.size)