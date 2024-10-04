

shared singleton Class constructor()
	
exposed onHTTPGet Function buildShoppingList($products : cs:C1710.ProductsSelection) : 4D:C1709.OutgoingMessage
	
	var $p : cs:C1710.ProductsEntity
	var $content : Text
	var $response : 4D:C1709.OutgoingMessage:=4D:C1709.OutgoingMessage.new()
	
	$content:=""
	
	For each ($p; $products)
		$content:=$content+" "+$p.manufacturer+" - "+$p.name
		$content:=$content+Char:C90(Carriage return:K15:38)
	End for each 
	
	$response.setBody($content)
	$response.setHeader("Content-Type"; "text/plain")
	
	return $response