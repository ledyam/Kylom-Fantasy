extends Control
@onready var progress_bar: ProgressBar = $"CanvasLayer/Panel de Vida/ProgressBar"
var player : MainPlayer
@onready var indicador: Label = $"CanvasLayer/Panel de Vida/ProgressBar/Indicador"


func _ready() -> void:
	player = self.owner
	progress_bar.max_value = player.vida_Max
	
func _on_player_lose_life(life: float) -> void:
	progress_bar.value = life
	pass # Replace with function body.

func _process(delta: float) -> void:
	indicador.text = str(player.vida_actual) + " | " + str(player.vida_Max)
	
	if progress_bar.value < player.vida_Max - 2 :
		progress_bar.get_theme_stylebox("fill").corner_radius_top_right = 6
		progress_bar.get_theme_stylebox("fill").corner_radius_bottom_right = 6
	
