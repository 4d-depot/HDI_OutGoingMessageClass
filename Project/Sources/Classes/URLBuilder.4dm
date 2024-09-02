

shared singleton Class constructor()
	
	
exposed shared Function buildThumbnailURL($product : cs:C1710.ProductsEntity; $size : Text) : Text
	
	var $url : Text
	
	Case of 
		: ($size="small")
			$width:=200
			$height:=200
			
		: ($size="large")
			$width:=400
			$height:=400
			
	End case 
	
	$url:=getPhotoURL($product.name; $width; $height)
	
	return $url
	
	
exposed shared Function buildUserManualURL($product : cs:C1710.ProductsEntity) : Text
	
	var $url : Text
	
	$url:=getUserManualURL($product)
	
	return $url
	
	