Class extends DataClass


exposed onHTTPGet Function getThumbnail($name : Text; $width : Integer; $height : Integer) : 4D:C1709.OutgoingMessage
	
	var $file:=File:C1566("/RESOURCES/Images/"+$name+".jpg")
	var $image; $thumbnail : Picture
	var $response:=4D:C1709.OutgoingMessage.new()
	
	
	READ PICTURE FILE:C678($file.platformPath; $image)
	CREATE THUMBNAIL:C679($image; $thumbnail; $width; $height; Scaled to fit:K6:2)
	
	$response.setBody($thumbnail)
	$response.setHeader("Content-Type"; "image/jpeg")
	
	return $response
	
	
exposed onHTTPGet Function getUserManual($product : cs:C1710.ProductsEntity) : 4D:C1709.OutgoingMessage
	
	var $file:=File:C1566("/RESOURCES/User manuals/"+$product.name+".pdf")
	var $response:=4D:C1709.OutgoingMessage.new()
	
	$response.setBody($file.getContent())
	$response.setHeader("Content-Type"; "application/pdf")
	
	return $response
	
	
	