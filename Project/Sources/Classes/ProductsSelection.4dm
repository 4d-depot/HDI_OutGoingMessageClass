Class extends EntitySelection


exposed Function addProduct($product : cs:C1710.ProductsEntity) : cs:C1710.ProductsSelection
	
	return This:C1470.copy().add($product)