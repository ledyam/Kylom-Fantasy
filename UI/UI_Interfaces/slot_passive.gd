extends CenterContainer

@export_enum("Cabeza : 0" , "Pecho : 1", "Piernas : 2" ,  "Arma : 3" ,         \
 " Protección : 4", "Botas : 5","Manos : 6"  ) var slot_type : int 


var Default : Dictionary = {
	
	0:load("res://Assets/GUI/GUI/Casco.png"),
	1:load("res://Assets/GUI/GUI/Pecho.png"),
	2:load("res://Assets/GUI/GUI/Pantalones.png"),
	3:load("res://Assets/GUI/GUI/Arma.png"),
	4:load("res://Assets/GUI/GUI/Protection.png"),
	5:load("res://Assets/GUI/GUI/Botas.png"),
	#6:load("res://Assets/GUI/GUI/Manos.png")
}

var item : Dictionary:
	set(value):
		item = value
		if item.is_empty() :
			$Icon.texture = Default[slot_type]
		else:
			$Equip.play()
			$Icon.texture = load(item["Texture"])

func _on_mouse_entered() -> void:
	if item.is_empty() : 
		owner.Normality()
		
	else : 
		owner.set_description(item)
	pass 

func _ready() -> void:
		$Icon.texture = Default[slot_type]


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if !self.item.is_empty():
			$Icon.texture = Default[slot_type]
			owner.Normality()
			$Unquip.play()
			var unquip = owner.find_child("Inventario") 
			unquip.add_item(item.duplicate(true))
			self.item.clear()
