extends Node2D

@onready var marcus: MainPlayer = $Marcus

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		marcus.Give_Exp(2)
