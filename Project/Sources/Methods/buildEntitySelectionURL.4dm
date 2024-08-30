//%attributes = {}


#DECLARE($dataset : Text) : Text

var $url : Text

$obj:={__DATASET: $dataset; __ENTITIES: True:C214}

$text:=JSON Stringify:C1217($obj)


$url:="http://127.0.0.1:80/rest/Products/buildShoppingList?$params="

$url:=$url+"'["

$url:=$url+$text

$url:=$url+"]'"

return $url



//http://127.0.0.1:8044/rest/$catalog/buildShoppingList?$params='[{"__DATASET": "C538D397381A42BA971F99C963F316B4","__ENTITIES": true}]'