extends Node2D


@onready var player: MainPlayer = $Player
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D
var aux : Array
var skeleton = load("res://Data/Enemys/Skeleton/skeleton.tscn")
@onready var ciclo_day_night: AnimationPlayer = $"Ciclo Day_Night"


func _ready() -> void:
	audio.play()
	ciclo_day_night.play("Ciclo General")




func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Morir"):
		var ske = skeleton.instantiate()
		ske.global_position = Vector2(randf_range(50,400), randf_range(-50 , 50))
		add_child(ske)
	pass

func _on_area_2d_body_entered(_body: Node2D) -> void:
	Dialogic.start("timeline")
	pass # Replace with function body.
