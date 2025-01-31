extends Slot

@onready var contador: Label = $BG/Contador



var cantidad : int = 0 :
	set(value):
		if cantidad < CANTIDAD_MAX:
			cantidad = value
			contador.text = "x"+str(cantidad)
			if  cantidad > CANTIDAD_MIN :
				contador.visible = true
			else : contador.visible = false

const CANTIDAD_MIN = 1
const CANTIDAD_MAX = 99


func VaciarSLot() -> void : 
	
	self.cantidad = 0 
	self.item = null 
	self.is_vacio = true
	
	

#Accion de usar objeto Consumible del Inventario 
func _on_gui_input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton and event.pressed:
		
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				if self.item != null  and item.type == 8:
						Consumir_Item()
				if  self.item != null and item.type != 8:
						Equipar_Item()
						
						

		
		


#region Uso de Item

func Consumir_Item():
	CentralSignal.UsarObjeto.emit(item.attribute_value)
	cantidad -= 1
	if item.type == 9:
		$Sounds/Tomar.play()
	else : 
		$Sounds/Comer.play()
		
	if cantidad == 0 :
		VaciarSLot()
		owner.Default_Description()

func Equipar_Item():
	var Equipables_SLot = owner.find_child("Equipable_Item").get_children()  
	
	for i in Equipables_SLot:
		if i.slot_type == item.type and  i.item != item :
			IntercambiarItem(i)
			i.item = item
			Asignar_Stats()
			VaciarSLot()
			break
			
			
func IntercambiarItem(slot : SlotPasive):
	slot.DesequiparItem()
	
#endregion

func Asignar_Stats():
	
	match item.attribute : 
		"ATK" : 
			owner.player_reference.stats.ATK += item.attribute_value
		"DEF" : 
			owner.player_reference.stats.DEF += item.attribute_value


func _get_drag_data(_at_position: Vector2) -> Variant:
	var preview_texture = TextureRect.new()
	var control = Control.new()
	var item_temp : Array

	
	preview_texture.texture = self.item.texture
	
	item_temp.append(item)
	item_temp.append(cantidad)
	
	
	control.add_child(preview_texture)
	control.z_index = 1
	
	set_drag_preview(control)
	VaciarSLot()
	return item_temp

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Array or Item
	
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if data is Array : 
		self.item = data[0]
		cantidad = data [1]
		self.is_vacio = false
	elif data is Item :  
		self.item = data
		
	$Sounds/Cambiar_Slot.play()


func _on_mouse_entered() -> void:
	if item != null : 
		owner.set_description(item)
	pass # Replace with function body.
