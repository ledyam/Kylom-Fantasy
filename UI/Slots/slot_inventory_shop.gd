extends Slot


var cantidad : int = 0 :
	set(value):
		if cantidad < CANTIDAD_MAX:
			cantidad = value
			$BG/Contador.text = "x"+str(cantidad)
			if  cantidad > CANTIDAD_MIN :
				$BG/Contador.visible = true
			else : $BG/Contador.visible = false

const CANTIDAD_MIN = 1
const CANTIDAD_MAX = 99


func _on_gui_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("click derecho"):
		if cantidad >= CANTIDAD_MIN :
			var item_temp : Array
			item_temp.append(item)
			item_temp.append(cantidad -(cantidad-1))
			cantidad -= 1
			if cantidad == CANTIDAD_MIN - 1 :
				VaciarSLot()
			%Productos.VenderItems(item_temp) 
			
func _make_custom_tooltip(_for_text: String) -> Object:
	var tooltip = preload("res://UI/Tooltip/tooltipItem.tscn").instantiate()
	if item != null :
		tooltip.SetItem(self.item)
		return tooltip
	else : return null 
