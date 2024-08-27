extends Control
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player_2d.play()
	pass # Replace with function body.




func _on_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Data/World/world.tscn")
	pass # Replace with function body.
