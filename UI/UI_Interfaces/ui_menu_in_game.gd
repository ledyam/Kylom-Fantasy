extends Control
@onready var menu: NinePatchRect = $Menu
@onready var inventario: NinePatchRect = $Inventario
@export_multiline var default_text : String
@export var description :NinePatchRect

#Muestra Descripción , textura y Título del Item
func set_description(item : Dictionary):
	description.find_child("Name").text = item["Name"]
	description.find_child("Icon").texture = load(item["Texture"])
	description.find_child("Description").text = item["Description"]

#Metodo por defecto para el Inventario General
func Normality ():
	description.find_child("Name").text = "Inventory"
	description.find_child("Icon").texture = null
	description.find_child("Description").text = default_text

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		if menu.visible == true :
			menu.visible  = false 
		else : 
			menu.visible = true
			
		if inventario.visible:
			inventario.visible = false 
			
	if event.is_action_pressed("Inventory"):
		if inventario.visible: 
			inventario.visible = false 
		else : inventario.visible = true 

func _on_inventory_pressed() -> void:
	if inventario.visible == false: 
		inventario.visible = true
	
	pass # Replace with function body.
