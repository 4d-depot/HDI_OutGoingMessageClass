Class extends DataClass


exposed onHTTPGet Function getThumbnail($name : Text; $width : Integer; $height : Integer) : 4D:C1709.OutgoingMessage
	
	var $file : 4D:C1709.File
	var $image; $thumbnail : Picture
	var $blob : Blob
	var $response : 4D:C1709.OutgoingMessage:=4D:C1709.OutgoingMessage.new()
	
	
	$file:=File:C1566("/RESOURCES/Images/"+$name+".jpg")
	
	READ PICTURE FILE:C678($file.platformPath; $image)
	
	CREATE THUMBNAIL:C679($image; $thumbnail; $width; $height; Scaled to fit:K6:2)
	
	PICTURE TO BLOB:C692($thumbnail; $blob; "image/jpeg")
	
	$response.setBody($blob)
	
	$response.setHeader("Content-Type"; "image/jpeg")
	
	return $response
	
	
exposed onHTTPGet Function getUserManual($product : cs:C1710.ProductsEntity) : 4D:C1709.OutgoingMessage
	
	var $file : 4D:C1709.File
	var $blob : Blob
	var $response : 4D:C1709.OutgoingMessage:=4D:C1709.OutgoingMessage.new()
	
	$file:=File:C1566("/RESOURCES/User manuals/"+$product.name+".pdf")
	
	$blob:=$file.getContent()
	$response.setBody($blob)
	$response.setHeader("Content-Type"; "application/pdf")
	$response.setStatus(200)
	
	return $response
	
	
exposed onHTTPGet Function buildShoppingList($products : cs:C1710.ProductsSelection) : 4D:C1709.OutgoingMessage
	
	var $p : cs:C1710.ProductsEntity
	var $content : Text
	var $file : 4D:C1709.File
	var $result : Boolean
	var $blob : Blob
	var $response : 4D:C1709.OutgoingMessage:=4D:C1709.OutgoingMessage.new()
	
	
	$file:=File:C1566("/RESOURCES/shoppingList.txt")
	$content:=""
	
	For each ($p; $products)
		$content:=$content+" "+$p.manufacturer+" - "+$p.name
		$content:=$content+Char:C90(Carriage return:K15:38)
	End for each 
	
	$file.setText($content)
	$blob:=$file.getContent()
	
	$response.setBody($blob)
	$response.setHeader("Content-Type"; "text/plain")
	$response.setStatus(200)
	
	return $response