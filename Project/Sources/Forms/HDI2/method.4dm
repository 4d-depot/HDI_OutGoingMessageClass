Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		btnTrace:=False:C215
		
		InitInfo
		
		// Page 1
		Form:C1466.products:=ds:C1482.Products.all()
		
		Form:C1466.small:=1
		
		Form:C1466.size:="small"
		
		LISTBOX SELECT ROW:C912(*; "Products"; 1; lk replace selection:K53:1)
		
		Form:C1466.product:=Form:C1466.products.first()
		
		Form:C1466.photoURL:=cs:C1710.URLBuilder.me.buildThumbnailURL(Form:C1466.product; Form:C1466.size)
		// Page 2 
		LISTBOX SELECT ROW:C912(*; "Products2"; 1; lk replace selection:K53:1)
		
		Form:C1466.product2:=Form:C1466.products.first()
		
		Form:C1466.userManualURL:=cs:C1710.URLBuilder.me.buildUserManualURL(Form:C1466.product2)
		
		// Page 3
		Form:C1466.getEntitySet:="/rest/Products?$filter=\"price<=100\"&$method=entityset"
		
		Form:C1466.orderedProducts:=ds:C1482.Products.all().orderBy("price")
		
		OBJECT SET ENABLED:C1123(*; "Download"; False:C215)
		
		manageTexts
		
	: (Form event code:C388=On Page Change:K2:54)
		
		OBJECT SET ENABLED:C1123(*; "Download"; False:C215)
		
		manageTexts
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			CANCEL:C270
		End if 
		
End case 

