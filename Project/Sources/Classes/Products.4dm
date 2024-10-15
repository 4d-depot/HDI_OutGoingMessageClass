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
	
	
	
exposed onHTTPGet Function getUserManual_TODELETE($productId : Integer; $type : Text) : 4D:C1709.OutgoingMessage
	var $file : 4D:C1709.File
	var $response:=4D:C1709.OutgoingMessage.new()
	var $doc:="/RESOURCES/User manuals/product_"+String:C10($productId)
	
	Case of 
		: ($type="pdf")
			$file:=File:C1566($doc+".pdf")
			$response.setBody($file.getContent())  // This is binary content 
			$response.setHeader("Content-Type"; "application/pdf")
			
		: ($type="jpeg")
			$file:=File:C1566($doc+".jpeg")
			$response.setBody($file.getContent())  // This is binary content
			$response.setHeader("Content-Type"; "image/jpeg")
	End case 
	return $response
	