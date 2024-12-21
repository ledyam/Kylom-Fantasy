extends Resource
## En esta clase se encuentran todas las estadisticas del Personaje
class_name Stats 

var player : MainPlayer
const NOMBRE = "Marcus"

var vida_actual : float  = 100 :
	set(value):
		if value <= 0 :
			vida_actual = 0
			player.player_ui.progress_bar.value = value
			player.player_ui.indicador_vida.text = str(0) + "|" + str(vida_Max)
			
		elif value > 0  :
				vida_actual = value
				if vida_actual > vida_Max:
					vida_actual = vida_Max
				player.player_ui.progress_bar.value = vida_actual
				player.player_ui.indicador_vida.text = str(vida_actual) + "|" + str(vida_Max) 
var vida_Max : float = 100 :
	set(value):
		vida_Max = value
		player.player_ui.progress_bar.max_value = value
var current_Exp : float  : 
	set(value):
		current_Exp = value 
		player.player_ui.progress_bar_exp.value = value
		player.player_ui.indicador_exp.text = str(value) + "|" + str(Max_Exp) 
var Max_Exp : float = 50:
	set(value):
		Max_Exp = value
		player.player_ui.progress_bar_exp.max_value = value
var current_level : int = 1 :
	
	set(value):
		current_level = value 
		player.indicador_nombre_level.text = NOMBRE + " Lv." + str(current_level)
var ATK :  float = 100
var DEF : float = 20
