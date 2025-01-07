extends Control
@onready var inventario: NinePatchRect = $CanvasLayer/Control/Inventario
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var stats_player: NinePatchRect = $CanvasLayer/Control/StatsPlayer

var player : MainPlayer

func _ready() -> void:
	$CanvasLayer/Control/Menu.visible = false
	inventario.visible = false
	$CanvasLayer/Control/Saving_Alert.visible = false 
	player = self.owner
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc") :
		if  $CanvasLayer/Control/Menu.visible : 
			animation_player.play("Hide_menu")

		elif !$CanvasLayer/Control/Menu.visible && $CanvasLayer/Control/Inventario.visible or $CanvasLayer/Control/Bestiary.visible: 
			$CanvasLayer/Control/Inventario.visible = false 
			$CanvasLayer/Control/Bestiary.visible = false
		elif !$CanvasLayer/Control/Menu.visible: 
			animation_player.play("Show_menu")

	if event.is_action_pressed('Inventory'):
		if inventario.visible:
			animation_player.play("Hide_inventory")
		elif !$CanvasLayer/Control/Bestiary.visible :
				animation_player.play("Show_inventory")


func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/Menú Principal/principal_menu.tscn")
	pass # Replace with function body.


func _on_inventario_pressed() -> void:
	animation_player.play("Hide_menu")
	await animation_player.animation_finished
	animation_player.play("Show_inventory")
	

func _on_bestiario_pressed() -> void:
	animation_player.play("Hide_menu")
	await animation_player.animation_finished
	$CanvasLayer/Control/Bestiary.visible = true 
	pass # Replace with function body.



#region Seccion de Guardado y Cargado de Partida

func _on_guardar_pressed() -> void:
	SaveLoad.Save(player , inventario.GuardarInv())
	$CanvasLayer/Control/Saving_Alert.visible = true
	await get_tree().create_timer(2).timeout
	$CanvasLayer/Control/Saving_Alert.visible = false
	pass
	
func _on_cargar_pressed() -> void:
	var data : Dictionary =  SaveLoad.Load()
	
#region Estadisiticas del Player
	player.position = str_to_var(data.player.position)
	player.stats.current_life = str_to_var(data.player.current_life)
	player.stats.current_exp = str_to_var(data.player.current_exp)
	player.stats.max_life =  str_to_var (data.player.max_life) 
	player.stats.max_exp =  str_to_var (data.player.max_exp)
	player.stats.current_level = str_to_var (data.player.current_level)
#endregion

#region Inventario
	inventario.CargarInv(data.inventory)
#endregion
	
#region Datos del Tiempo
	#player.player_ui.reloj.minute = str_to_var(data.player.player_reloj.minute)
	#player.player_ui.reloj.hour = str_to_var(data.player.player_reloj.hour)
	#player.player_ui.reloj.day = str_to_var(data.player.player_reloj.day)
	#player.player_ui.reloj.count_week_day = str_to_var(data.player.player_reloj.week_day)
	#player.player_ui.reloj.month_count = str_to_var(data.player.player_reloj.month)
#endregion
	
#region Instanciación de Enemigos Guardados

	if !get_tree().get_nodes_in_group("Enemy").is_empty():
		get_tree().call_group("Enemy", "queue_free")
		for enemy_config in data.enemies:
			var enemy = preload("res://Data/Enemys/Goblin/goblin 2.0.tscn").instantiate()
			enemy.global_position = str_to_var(enemy_config.position)
			get_tree().current_scene.add_child(enemy)
	pass # Replace with function body.
#endregion

#endregion
