extends Node
const SAVE_PATH = "user://Guardado1.json"


func Save (player : Player , inventario) -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	
	var save_dict = {
		
		player = {
			position = var_to_str(player.position),
			current_life= var_to_str(player.stats.current_life),
			current_exp = var_to_str(player.stats.current_exp),
			max_life = var_to_str (player.stats.max_life), 
			max_exp =  var_to_str(player.stats.max_exp),
			current_level = var_to_str (player.stats.current_level),
			
			#player_reloj = {
				#month = var_to_str (player.player_ui.reloj.month_count),
				#day = var_to_str (player.player_ui.reloj.day),
				#hour = var_to_str (player.player_ui.reloj.hour),
				#minute =var_to_str (player.player_ui.reloj.minute),
				#week_day = var_to_str (player.player_ui.reloj.count_week_day)
			#},
		},
		inventory = inventario,
		enemies = []
	}

	for enemy in get_tree().get_nodes_in_group("Enemy"):
		save_dict.enemies.push_back({
			position = var_to_str(enemy.position),
		})
	file.store_line(JSON.stringify(save_dict))
	pass

func Load():
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var json := JSON.new()
	json.parse(file.get_line())
	var save_dict := json.get_data() as Dictionary
	return save_dict
	
