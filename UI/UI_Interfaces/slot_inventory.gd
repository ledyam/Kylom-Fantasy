extends Control

@onready var contador: Label = $Contador

enum use_type {COMER, TOMAR}

var is_vacio : bool = true
var cantidad : int = 0 :
	set(value):
		cantidad = value
		contador.text = "x"+str(cantidad)
		if cantidad != 0 and cantidad != 1 :
			contador.visible = true
		else : contador.visible = false
	

var item : Dictionary:
	set(value):
		item = value
		if item.is_empty() :
			$CenterContainer/Icon.texture = null
		else:
			$CenterContainer/Icon.texture = load(item["Texture"])

func _on_mouse_entered() -> void:
	if item.is_empty() :
		owner.Normality()
	else :
		owner.set_description(item)
	pass

	
#Accion de usar objeto Consumible del Inventario 
func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if !self.item.is_empty() and item.has("Health_give"):
			print("sumando Vida")
			CentralSignal.UsarObjeto.emit(item["Health_give"])
			cantidad -= 1
			if item["Use_Type"] == use_type.TOMAR:
				$Sounds/Tomar.play()
			else : 
				$Sounds/Comer.play()
			
			
			
			if cantidad == 0 :
				self.item.clear()
				is_vacio = true
				$CenterContainer/Icon.texture = null
				owner.Normality()
		elif item.has("Type") :
			var Equipables_SLot = owner.find_child("Equipable_Item").get_children()
			
			for i in Equipables_SLot:
				if i.slot_type == item["Slot_Type"] and  i.item != item :
					i.item = item.duplicate(true)
					item.clear()
					$CenterContainer/Icon.texture = null
					is_vacio = true
					break
	pass # Replace with function body.
