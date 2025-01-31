extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		var enemy = load("res://Data/Enemys/Goblin/goblin 2.0.tscn")  
		var ske = enemy.instantiate()
		ske.global_position = self.position
		add_child(ske)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
