extends Button
class_name ButtonWithSound




	


func _on_mouse_entered() -> void:
	$Sounds/Hover.play()
	pass # Replace with function body.

func _on_pressed() -> void:
	$Sounds/Pressed.play()
	pass # Replace with function body.
