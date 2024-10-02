

shared singleton Class constructor()
	
exposed onHTTPGet Function buildShoppingList($products : cs:C1710.ProductsSelection) : 4D:C1709.OutgoingMessage
	
	var $p : cs:C1710.ProductsEntity
	var $content : Text
	var $response : 4D:C1709.OutgoingMessage:=4D:C1709.OutgoingMessage.new()
	
	$content:=""
	
	If ($products#Null:C1517)
		For each ($p; $products)
			$content:=$content+" "+$p.manufacturer+" - "+$p.name
			//$content:=$content+Char(Carriage return)
		End for each 
		
		$response.setBody($content)
		$response.setHeader("Content-Type"; "text/plain")
		$response.setStatus(200)
	End if 
	
	return $response