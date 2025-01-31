extends Control


func _ready() -> void:
	$AnimationPlayer.play("Creditos")
	$"Clouds-29191".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
