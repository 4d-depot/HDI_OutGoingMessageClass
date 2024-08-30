//%attributes = {}

var $p : cs:C1710.ProductsEntity
var $productsFile; $photo : 4D:C1709.File
var $productsColl : Collection
var $status : Object


$productsFile:=File:C1566("/RESOURCES/products.json")
$productsColl:=JSON Parse:C1218($productsFile.getText())

ds:C1482.Products.all().drop()
ds:C1482.Products.fromCollection($productsColl)


For each ($p; ds:C1482.Products.all())
	$photo:=File:C1566("/RESOURCES/Images/"+$p.name+".jpg")
	$p.photo:=$photo.path
	$status:=$p.save()
End for each 