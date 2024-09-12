extends Control
@onready var progress_bar: ProgressBar = $"CanvasLayer/Panel de Vida/ProgressBar"
var player : MainPlayer
@onready var indicador: Label = $"CanvasLayer/Panel de Vida/ProgressBar/Indicador"
@onready var indicador_exp: Label = $"CanvasLayer/Panel de Exp/ProgressBar_exp/IndicadorEXP"

@onready var progress_bar_exp: ProgressBar = $"CanvasLayer/Panel de Exp/ProgressBar_exp"
var LEVEL_DATA : Dictionary
var resto= 0 

func _ready() -> void:
	player = self.owner
	indicador.text = str(player.vida_actual) + " | " + str(player.vida_Max)
	indicador_exp.text = str(progress_bar_exp.value)+ '|'+str(progress_bar_exp.max_value)
	DataBase.connect("Data_Ready",on_ready_DataBase)
	DataBase.database.execute('SELECT "Nivel", "Experiencia_Necesaria", "Experiencia_Total"
	FROM public."Experience_Table";')
	DataBase.data_type = "Level"

func _on_player_lose_life(life_losting: float) -> void:
	if (progress_bar.value - life_losting) > 0 : 
		progress_bar.value = life_losting
		indicador.text = str(player.vida_actual) + " | " + str(player.vida_Max)
		if progress_bar.value < player.vida_Max - 2 :
			progress_bar.get_theme_stylebox("fill").corner_radius_top_right = 6
			progress_bar.get_theme_stylebox("fill").corner_radius_bottom_right = 6
	else :
		progress_bar.value = 0 
		indicador.text = str(player.vida_actual) + " | " + str(player.vida_Max)

func _on_marcus_give_life(life: float) -> void:
	progress_bar.value = life
	indicador.text = str(player.vida_actual) + " | " + str(player.vida_Max)
	if progress_bar.value < player.vida_Max - 2 :
		progress_bar.get_theme_stylebox("fill").corner_radius_top_right = 6
		progress_bar.get_theme_stylebox("fill").corner_radius_bottom_right = 6
	
 # Replace with function body.
func _on_marcus_give_exp(exp: int) -> void:
	if   (progress_bar_exp.value + exp) > progress_bar_exp.max_value:
		resto = (progress_bar_exp.value + exp) - progress_bar_exp.max_value
		player.LEVEL_UP()
		progress_bar_exp.max_value = LEVEL_DATA[player.current_level]["Experiencia_Necesaria"]
		progress_bar_exp.value = 0 
		progress_bar_exp.value += resto
		Actualizar_Label_Exp()
	else : 
		progress_bar_exp.value += exp
		Actualizar_Label_Exp()
		
func on_ready_DataBase():
	if DataBase.data_type == "Level":
		LEVEL_DATA = DataBase.Items_data.duplicate(true)
		DataBase.Clean_Library()
	

func Actualizar_Label_Exp():
	indicador_exp.text = str(progress_bar_exp.value)+ '|'+str(progress_bar_exp.max_value)

func Actualizar_Label_UI_Life():
	progress_bar.value = player.vida_actual
	indicador.text = str(player.vida_actual) + " | " + str(player.vida_Max)
	if progress_bar.value < player.vida_Max - 2 :
		progress_bar.get_theme_stylebox("fill").corner_radius_top_right = 6
		progress_bar.get_theme_stylebox("fill").corner_radius_bottom_right = 6
	
