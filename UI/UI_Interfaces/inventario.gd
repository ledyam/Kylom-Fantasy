extends NinePatchRect


func add_item (item ) :
	var index = self.find_child("GridContainer")
	
	for i in index.get_children():
		
		if !i.is_vacio and i.item == item :
			i.cantidad += 1
			$Sounds/CogerObjeto.play()
			break
		
		if i.is_vacio:
			i.item = item
			i.is_vacio = false
			i.cantidad += 1
			$Sounds/CogerObjeto.play()
			break

func add_item_load (item , cantidad ) :
	var index = self.find_child("GridContainer")
	
	for i in index.get_children():
		if i.is_vacio:
			i.item = item
			i.is_vacio = false
			i.cantidad = cantidad
			break

func GuardarInv():
	var index = self.find_child("GridContainer")
	var Exterior_Inventario : Dictionary 

	var j = 0 
	for i in index.get_children():
		if !i.item.is_empty() : 
			var Interior_Inventario : Dictionary 
			Interior_Inventario["item"] = i.item.duplicate(true)
			Interior_Inventario.Cantidad = i.cantidad 
			Exterior_Inventario[str(j)] = Interior_Inventario
			j += 1
		
	print(Exterior_Inventario)
	return Exterior_Inventario
func CargarInv(items : Dictionary):
	var index = self.find_child("GridContainer")
	for i in index.get_children():
		i.item.clear()
		i.is_vacio = true
	
	for item in items:
		add_item_load(items[item].item, items[item].Cantidad)
	
