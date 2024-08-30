//%attributes = {}


#DECLARE($dataset : Text) : Text

var $url : Text
var $obj : Object
var $text : Text

$obj:={__DATASET: $dataset; __ENTITIES: True:C214}

$text:=JSON Stringify:C1217($obj)

$url:="http://127.0.0.1:80/rest/Products/buildShoppingList?$params="

$url:=$url+"'["

$url:=$url+$text

$url:=$url+"]'"

return $url
