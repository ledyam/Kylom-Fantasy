extends Control

@export_enum("Cabeza : 0" , "Pecho : 1", "Piernas : 2" ,  "Arma : 3" ,         \
			 " Protección : 4", "Botas : 5", "Anillo : 6" , "Collar: 7")       \
var slot_type : int 


var default : Dictionary = {
	0:load("res://Assets/GUI/GUI/Casco.png"),
	1:load("res://Assets/GUI/GUI/Pecho.png"),
	2:load("res://Assets/GUI/GUI/Pantalones.png"),
	3:load("res://Assets/GUI/GUI/Arma.png"),
	4:load("res://Assets/GUI/GUI/Protection.png"),
	5:load("res://Assets/GUI/GUI/Botas.png"),
	6:load("res://Assets/GUI/GUI/Anillo.png"),
	7:load("res://Assets/GUI/GUI/Collar.png")
}

var item : Item:
	set(value):
		item = value
		if item == null :
			$CenterContainer/Icon.texture = default[slot_type]
		else:
			$Equip.play()
			$CenterContainer/Icon.texture = item.texture

func _on_mouse_entered() -> void:
	if item == null : 
		owner.Default()
	else : 
		owner.set_description(item)
	pass 
	
func _ready() -> void:
		$CenterContainer/Icon.texture = default[slot_type]


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if self.item != null:
			$CenterContainer/Icon.texture = default[slot_type]
			owner.Default()
			Desasignar_Stats()
			$Unquip.play()
			owner.add_item(item)
			self.item = null



func Desasignar_Stats():
	match item.type : 
		"Wapon" : 
			owner.owner.player.ATK -= item.attribute_value
