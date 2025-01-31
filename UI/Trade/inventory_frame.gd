extends Panel



#Método para agregar items al inventario
func add_item (item ) :
	var index = self.find_child("GridContainer")
	
	for i in index.get_children():
		
		if IsConsumibleMax(i , item):
			i.cantidad += 1
			break

			
		elif i.is_vacio:
			i.item = item
			i.is_vacio = false
			i.cantidad += 1

			break

	
func IsConsumibleMax(slot , item) -> bool : 
	return !slot.is_vacio and slot.item == item and item.type == 8 \
	and slot.CANTIDAD_MAX > slot.cantidad
	
