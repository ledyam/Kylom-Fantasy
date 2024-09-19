extends Control
@onready var menu: NinePatchRect = $Menu
@onready var inventario: NinePatchRect = $CanvasLayer/Control/Inventario
@export_multiline var default_text : String
@export var description :NinePatchRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var player : Player


func _ready() -> void:
	menu.visible = false
	inventario.visible = false
	player = self.owner
	
#Muestra Descripción , textura y Título del Item
func set_description(item : Dictionary):
	description.find_child("Name").text = item["Name"]
	description.find_child("Icon").texture = load(item["Texture"])
	description.find_child("Description").text = item["Description"]

#Metodo por defecto para el Inventario General
func Normality ():
	description.find_child("Name").text = "Inventario"
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
	SaveLoad.Save(player , inventario.GuardarInv())
	$CanvasLayer/Saving_Alert.visible = true
	await get_tree().create_timer(2).timeout
	$CanvasLayer/Saving_Alert.visible = false
	pass
	
func _on_cargar_pressed() -> void:
	var data : Dictionary =  SaveLoad.Load()
	
	
#region Estadisiticas del Player
	player.position = str_to_var(data.player.position)
	player.vida_actual  = str_to_var(data.player.vida_actual)
	player.current_Exp = str_to_var(data.player.current_Exp)
	player.vida_Max =  str_to_var (data.player.vida_Max) 
	player.Max_Exp =  str_to_var (data.player.Max_Exp)
	player.current_level = str_to_var (data.player.current_level)
#endregion
	
#region Inventario
	inventario.CargarInv(data.inventory)
#endregion
	
#region Datos del Tiempo
	player.player_ui.reloj.minute = str_to_var(data.player.player_reloj.minute)
	player.player_ui.reloj.hour = str_to_var(data.player.player_reloj.hour)
	player.player_ui.reloj.day = str_to_var(data.player.player_reloj.day)
	player.player_ui.reloj.count_week_day = str_to_var(data.player.player_reloj.week_day)
	player.player_ui.reloj.month_count = str_to_var(data.player.player_reloj.month)
#endregion
	
		
	
	
	if !get_tree().get_nodes_in_group("Enemy").is_empty():
		get_tree().call_group("Enemy", "queue_free")
		for enemy_config in data.enemies:
			var enemy = preload("res://Data/Enemys/Skeleton/skeleton.tscn").instantiate()
			enemy.position = str_to_var(enemy_config.position)
			get_tree().current_scene.add_child(enemy)
	pass # Replace with function body.
