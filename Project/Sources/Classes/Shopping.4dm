

shared singleton Class constructor()
	
exposed onHTTPGet Function buildShoppingList($products : cs:C1710.ProductsSelection) : 4D:C1709.OutgoingMessage
	
	var $p : cs:C1710.ProductsEntity
	var $content : Text
	var $file : 4D:C1709.File
	
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