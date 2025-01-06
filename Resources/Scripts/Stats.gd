extends Resource
## En esta clase se encuentran todas las estadisticas del Personaje
class_name Stats 

var player : MainPlayer
const NOMBRE = "Marcus"

var current_life: float  = 100 :
	set(value):
		if value <= 0 :
			current_life= 0
			player.player_ui.progress_bar.value = value
			player.player_ui.indicador_vida.text = str(0) + "|" + str(max_life)
			
		elif value > 0  :
				current_life= value
				if current_life> max_life:
					current_life= max_life
				player.player_ui.progress_bar.value = current_life
				player.player_ui.indicador_vida.text = str(current_life) + "|" + str(max_life) 
var max_life : float = 100 :
	set(value):
		max_life = value
		player.player_ui.progress_bar.max_value = value
var current_exp : float  : 
	set(value):
		current_exp = value 
		player.player_ui.progress_bar_exp.value = value
		player.player_ui.indicador_exp.text = str(value) + "|" + str(max_exp) 
var max_exp : float = 50:
	set(value):
		max_exp = value
		player.player_ui.progress_bar_exp.max_value = value
var current_level : int = 1 :
	set(value):
		current_level = value 

var ATK :  float = 50
var DEF : float = 25
