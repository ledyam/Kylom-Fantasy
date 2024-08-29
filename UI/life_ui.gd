extends Control

@onready var h_box_container: GridContainer = $"CanvasLayer/Panel de Vida/HBoxContainer"
var Corazones : Array = []

func _on_player_quitar_corazon() -> void:
	h_box_container.get_child(-1).queue_free()
