Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		Form:C1466.products:=ds:C1482.Products.all()
		
		Form:C1466.small:=1
		
		LISTBOX SELECT ROW:C912(*; "Products"; 1; lk replace selection:K53:1)
		
		Form:C1466.product:=Form:C1466.products.first()
		
		updatePhotoURL
		
		LISTBOX SELECT ROW:C912(*; "Products2"; 1; lk replace selection:K53:1)
		
		Form:C1466.product2:=Form:C1466.products.first()
		
		Form:C1466.entityURL:=buildEntityURL
		
		Form:C1466.getEntitySet:="/rest/Products?$filter=\"price>=140\"&$method=entityset"
		
		
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Get application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			CANCEL:C270
		End if 
		
End case 

