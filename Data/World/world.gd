extends Node2D
var skeleton = load("res://Data/Enemys/Skeleton/skeleton.tscn")
@onready var ciclo_day_night: AnimationPlayer = $"Ciclo Day_Night"



func _ready() -> void:
	ciclo_day_night.play("Ciclo General")
	CurrentZone.SetZone(self.name)



func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Morir"):
		var ske = skeleton.instantiate()
		ske.global_position = Vector2(randf_range(50,400), randf_range(-50 , 50))
		add_child(ske)
	pass

func _on_area_2d_body_entered(_body: Node2D) -> void:
	CurrentZone.SetZone("Forest")
	pass # Replace with function body.
	get_tree().create_tween()

func _on_entrada_casa_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Data/World/inter_house.tscn")
	pass # Replace with function body.
