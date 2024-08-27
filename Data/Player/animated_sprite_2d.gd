extends AnimatedSprite2D
signal _on_animation_finished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_animation_finished.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
