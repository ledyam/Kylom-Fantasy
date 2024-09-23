extends NinePatchRect

#Método para agregar items al inventario
func add_item (item ) :
	var index = self.find_child("GridContainer")
	
	for i in index.get_children():
		
		if !i.is_vacio and i.item == item and !item.has("Type"):
			i.cantidad += 1
			$Sounds/CogerObjeto.play()
			break
		
		
		elif i.is_vacio and item.has("Type"):
			i.is_vacio = false
			i.item = item
			$Sounds/CogerObjeto.play()
			break
			
		elif i.is_vacio:
			i.item = item
			i.is_vacio = false
			i.cantidad += 1
			$Sounds/CogerObjeto.play()
			break

#region Métodos de Abastecimiento de Inventario 

func add_item_Inventory_free(item , cantidad ) :
	
	var index = self.find_child("GridContainer")
	
	for i in index.get_children():
		if i.is_vacio:
			i.item = item
			i.is_vacio = false
			i.cantidad = cantidad
			break


func add_item_Inventory_Equipable(item):
#endregion
	var index = self.find_child("Equipable_Item")
	for i in index.get_children():
		if item["Slot_Type"] == i.slot_type:
			i.item = item



#region Sistema de Save_Load del Inventario

func GuardarInv():
	var index = self.find_child("GridContainer")
	
	var Exterior_Inventario : Dictionary = {
		 Inventario_free = {},
	Inventario_Equipable = {}
		
	}
	var j = 0 
	for i in index.get_children():
		if !i.item.is_empty() : 
			var Interior_Inventario : Dictionary 
			Interior_Inventario["item"] = i.item.duplicate(true)
			Interior_Inventario.Cantidad = i.cantidad 
			Exterior_Inventario.Inventario_free[str(j)] = Interior_Inventario
			j += 1
	j = 0 
	index = self.find_child("Equipable_Item")
	for i in index.get_children():
		if !i.item.is_empty() : 
			var Interior_Inventario : Dictionary
			Interior_Inventario["item"] = i.item.duplicate(true)
			Exterior_Inventario.Inventario_Equipable[str(j)] = Interior_Inventario
			j += 1
			
			
			
			
	return Exterior_Inventario
func CargarInv(items : Dictionary):
	var index = self.find_child("GridContainer")
	for i in index.get_children():
		i.item.clear()
		i.is_vacio = true
	for item in items.Inventario_free:
		add_item_Inventory_free(items.Inventario_free[item].item ,              \
		items.Inventario_free[item].Cantidad)
		
	for item in items.Inventario_Equipable:
		add_item_Inventory_Equipable( items.Inventario_Equipable[str(item)].item)
	
#endregion
