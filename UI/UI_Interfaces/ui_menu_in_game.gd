extends Control
@onready var menu: NinePatchRect = $Menu
@onready var inventario: NinePatchRect = $Inventario
@export_multiline var default_text : String
@export var description :NinePatchRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	menu.visible = false
	inventario.visible = false
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
	if event.is_action_pressed("Esc")   :
		if  menu.visible : 
			animation_player.play("Hide_menu")
		else: 
			animation_player.play("Show_menu")
		



	if event.is_action_pressed('Inventory'):
		if inventario.visible:
			animation_player.play("Hide_inventory")
		else :
			animation_player.play("Show_inventory")


func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/Menú Principal/principal_menu.tscn")
	pass # Replace with function body.


func _on_inventario_pressed() -> void:
	animation_player.play("Hide_menu")
	await animation_player.animation_finished
	animation_player.play("Show_inventory")
	


func _on_guardar_pressed() -> void:
	Save_Load.Save_Data(self.owner)
	pass # Replace with function body.


func _on_cargar_pressed() -> void:
	var pcurrent_scene
	var loaded_scene = Save_Load.Load_Data()
	get_tree().create_timer(5).timeout
	if loaded_scene:
		
		get_tree().current_scene.find_child("Marcus").queue_free()
		get_tree().current_scene.add_child(loaded_scene)
		


	
	
	
	
	pass # Rep--lace with function body.
