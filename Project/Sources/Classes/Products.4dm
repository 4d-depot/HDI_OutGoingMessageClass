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
	var $response : 4D:C1709.OutgoingMessage:=4D:C1709.OutgoingMessage.new()
	
	$file:=File:C1566("/RESOURCES/User manuals/"+$product.name+".pdf")
	$response.setBody($file.getContent())
	$response.setHeader("Content-Type"; "application/pdf")
	
	return $response
	
	
	
exposed onHTTPGet Function getUserManual_TO_DELETE($productId : Integer; $type : Text) : 4D:C1709.OutgoingMessage
	
	var $file : 4D:C1709.File
	var $response : 4D:C1709.OutgoingMessage:=4D:C1709.OutgoingMessage.new()
	var $doc : Text
	
	$doc:="/RESOURCES/User manuals/product_"+String:C10($productId)
	
	Case of 
		: ($type="pdf")
			$file:=File:C1566($doc+".pdf")
			$response.setHeader("Content-Type"; "application/pdf")
			
		: ($type="jpeg")
			$file:=File:C1566($doc+".jpeg")
			$response.setHeader("Content-Type"; "image/jpeg")
	End case 
	
	$response.setBody($file.getContent())
	
	return $response
	