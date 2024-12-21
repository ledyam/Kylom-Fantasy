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
		owner.Default()
	else :
		owner.set_description(item)
	pass

	
#Accion de usar objeto Consumible del Inventario 
func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if self.item != null  and item.type == 8:
			Item_Consumible()
		if  self.item != null and item.type != 8:
			Item_Equipable()
		
	pass # Replace with function body.

func Asignar_Stats():
	match item.type : 
		"Wapon" : 
			owner.owner.player.ATK += item.attribute_value

#region Uso de Item

func Item_Consumible():
	CentralSignal.UsarObjeto.emit(20)
	cantidad -= 1
	if item["Use_Type"] == 1:
		$Sounds/Tomar.play()
	else : 
		$Sounds/Comer.play()
		
	if cantidad == 0 :
		self.item.clear()
		is_vacio = true
		$CenterContainer/Icon.texture = null
		owner.Default()

func Item_Equipable():

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
