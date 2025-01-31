extends ItemList

var items_disponibles : Array[Item]



func _ready() -> void:
	for i in range (1000, 4000 , 1000):
		items_disponibles.append(DatabaseReference.item_database[i])
		
	for i in items_disponibles:
		self.add_item(i.name,i.texture)
		
		




func ComprarItems() -> Item:

	var item_seleccionado = get_selected_items()
	var puntero = item_seleccionado[0]
	
	if items_disponibles[puntero].is_unic:
		item_seleccionado = items_disponibles[puntero]
		remove_item(puntero)
		items_disponibles.remove_at(puntero)
		
	else : item_seleccionado = items_disponibles[puntero]
	
	$Buy_Sell.play()
	return item_seleccionado
	


func VenderItems(data : Array) : 
	PlayerMoney.SumarDinero.emit(data[0].precio * data[1])
	$Buy_Sell.play()
	ActualizarStock(data)


func ActualizarStock(data : Array):
	if data[0] not in items_disponibles:
		items_disponibles.append(data[0])
		add_item(data[0].name , data[0].texture)
		
	
	
#region DROP SECTION
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Array

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	
	VenderItems(data)
#endregion
