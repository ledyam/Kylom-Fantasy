extends Control

@onready var contador: Label = $Contador

var is_vacio : bool = true
var cantidad : int = 0 :
	set(value):
		cantidad = value
		contador.text = "x" + str(cantidad)
		if cantidad != 0 and cantidad != 1 :
			contador.visible = true
		else : contador.visible = false
var item : Item:
	set(value):
		item = value
		if item == null :
			$CenterContainer/Icon.texture = null
		else:
			$CenterContainer/Icon.texture = item.texture


func _on_mouse_entered() -> void:
	if item == null :
		owner.Default_Description()
	else :
		owner.set_description(item)
	pass

	
#Accion de usar objeto Consumible del Inventario 
func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if self.item != null  and item.type == 8:
			Consumir_Item()
		if  self.item != null and item.type != 8:
			Equipar_Item()
		
	pass # Replace with function body.

func Asignar_Stats():
	var player_reference = get_tree().current_scene.find_child("Marcus")
	match item.attribute : 
		"ATK" : 
			player_reference.stats.ATK += item.attribute_value
		"DEF" : 
			player_reference.stats.DEF += item.attribute_value

#region Uso de Item

func Consumir_Item():
	CentralSignal.UsarObjeto.emit(item.attribute_value)
	cantidad -= 1
	if item.type == 9:
		$Sounds/Tomar.play()
	else : 
		$Sounds/Comer.play()
		
	if cantidad == 0 :
		self.item = null
		is_vacio = true
		$CenterContainer/Icon.texture = null
		owner.Default_Description()

func Equipar_Item():

	var Equipables_SLot = owner.find_child("Equipable_Item").get_children()  
	
	for i in Equipables_SLot:
		if i.slot_type == item.type and  i.item != item :
			i.item = item
			Asignar_Stats()
			$CenterContainer/Icon.texture = null
			item = null
			is_vacio = true
			break
#endregion
