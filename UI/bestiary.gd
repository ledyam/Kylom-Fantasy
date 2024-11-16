extends Control

@export_multiline var default_text : String

func _ready() -> void:
	visible = false 
	Default_Description()
	CentralSignal.connect("Unlock_Bestiary",Unlock_Slot)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Bestiary")&& !visible && !$"../Inventario".visible:
		visible = true 
	
	elif event.is_action_pressed("Bestiary") && visible:
		self.visible = false
		
		


func Default_Description ():
	find_child("Description").text = default_text


func Unlock_Slot(mob_name):
	var index = find_child("Contenedor")
	for i in index.get_children():
		if !i.is_vacio and i.mob_name == mob_name : 
			break
			
		elif i.is_vacio:
			i.mob_name = mob_name
			i.icon.texture = load( "res://DataBase/Local/Enemys Portait/" + mob_name + ".png")
			i.is_vacio = false 
			break 

		
