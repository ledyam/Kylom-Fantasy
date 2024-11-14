extends Control
func _ready() -> void:
	visible = false 
	
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Bestiary") && !visible:
		visible = true 
	elif event.is_action_pressed("Bestiary") && visible:
		visible = false
