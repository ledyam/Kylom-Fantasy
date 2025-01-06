extends Control

@export_enum("Cabeza : 0" , "Pecho : 1", "Piernas : 2" ,  "Arma : 3" ,         \
			 " Protección : 4", "Botas : 5", "Anillo : 6" , "Collar: 7")       \

var slot_type : int 


var item : Item:
	set(value):
		item = value
		if item == null :
			$CenterContainer/Icon.texture = load("res://Assets/GUI/GUI/"+str(slot_type)+".png")
		else:
			$Equip.play()
			$CenterContainer/Icon.texture = item.texture

func _on_mouse_entered() -> void:
	if item == null : 
		owner.Default_Description()
	else : 
		owner.set_description(item)
	pass 
	
func _ready() -> void:
	$CenterContainer/Icon.texture =  load("res://Assets/GUI/GUI/"+str(slot_type)+".png")

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if self.item != null:
			$CenterContainer/Icon.texture = load("res://Assets/GUI/GUI/"+str(slot_type)+".png")
			owner.Default_Description()
			Desasignar_Stats()
			$Unquip.play()
			owner.add_item(item)
			self.item = null

func Desasignar_Stats():
	match item.type : 
		"Wapon" : 
			owner.owner.player.ATK -= item.attribute_value
