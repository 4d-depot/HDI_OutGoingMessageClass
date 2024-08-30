//%attributes = {}


#DECLARE($width : Integer; $height : Integer) : Text

var $url : Text


$url:="http://127.0.0.1:80/rest/Products/getThumbnail?$params="

$url:=$url+"'["

$url:=$url+"\""

$url:=$url+Form:C1466.product.name+"\""

$url:=$url+","+String:C10($width)+","+String:C10($height)

$url:=$url+"]'"

return $url