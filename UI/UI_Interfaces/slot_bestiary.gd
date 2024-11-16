extends Control


@onready var icon: TextureRect = $CenterContainer/Icon

var is_vacio : bool = true


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
		owner.find_child("Name").text = "Slime"
		owner.find_child("Description").text = " Un Slime culero"
		owner.find_child("AnimatedSprite2D").play(owner.find_child("Name").text)
		owner.find_child("Default").texture = null
		
		
			
			
