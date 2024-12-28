extends Control


@onready var icon: TextureRect = $CenterContainer/Icon

var is_vacio : bool = true
var mob_name : String

#var item : Dictionary:
	#set(value):
		#item = value
		#if item.is_empty() :
			#$CenterContainer/Icon.texture = null
		#else:
			#$CenterContainer/Icon.texture = load("res://Assets/Tiles/Pixelarium - GrassLands/Pixelarium - Enemy Pack1/Slime/Blue Slime/Bestiary_slot.png")




#Accion de usar objeto Consumible del Inventario 
func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if !is_vacio:
			owner.find_child("Name").text = mob_name
			owner.find_child("Description").text = " Un " + mob_name + " culero"
			owner.find_child("AnimatedSprite2D").play(mob_name)
			owner.find_child("Default").texture = null
		
		
			
			
