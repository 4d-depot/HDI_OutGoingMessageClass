//%attributes = {}


#DECLARE($name : Text; $width : Integer; $height : Integer) : Text

var $url : Text


$url:="http://127.0.0.1:80/rest/Products/getThumbnail?$params="

$url:=$url+"'["

$url:=$url+"\""

$url:=$url+$name+"\""

$url:=$url+","+String:C10($width)+","+String:C10($height)

$url:=$url+"]'"

return $url