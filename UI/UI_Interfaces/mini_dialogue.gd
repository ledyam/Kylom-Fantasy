extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spr_dialogue_box_9_slice_mouse_entered() -> void:
	Dialogic.start("Test")
	pass # Replace with function body.
