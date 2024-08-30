//%attributes = {}


#DECLARE() : Text

var $url : Text
var $obj : Object
var $text : Text

$obj:={__DATACLASS: "Products"; __ENTITY: True:C214; __KEY: Form:C1466.product2.getKey()}

$text:=JSON Stringify:C1217($obj)

$url:="http://127.0.0.1:80/rest/Products/getUserManual?$params="

$url:=$url+"'["

$url:=$url+$text

$url:=$url+"]'"

return $url