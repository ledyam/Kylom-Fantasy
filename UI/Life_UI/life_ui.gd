extends Control
@onready var progress_bar: ProgressBar = $"CanvasLayer/Panel de Vida/ProgressBar"
var player : MainPlayer
@onready var indicador: Label = $"CanvasLayer/Panel de Vida/ProgressBar/Indicador"


func _ready() -> void:
	player = self.owner
	indicador.text = str(player.vida_actual) + " | " + str(player.vida_Max)
	
func _on_player_lose_life(life: float) -> void:
	progress_bar.value = life
	indicador.text = str(player.vida_actual) + " | " + str(player.vida_Max)
	if progress_bar.value < player.vida_Max - 2 :
		progress_bar.get_theme_stylebox("fill").corner_radius_top_right = 6
		progress_bar.get_theme_stylebox("fill").corner_radius_bottom_right = 6
	

	


func _on_marcus_give_life(life: float) -> void:
	progress_bar.value = life
	indicador.text = str(player.vida_actual) + " | " + str(player.vida_Max)
	if progress_bar.value < player.vida_Max - 2 :
		progress_bar.get_theme_stylebox("fill").corner_radius_top_right = 6
		progress_bar.get_theme_stylebox("fill").corner_radius_bottom_right = 6
	
 # Replace with function body.
