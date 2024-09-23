extends Node2D
var skeleton = load("res://Data/Enemys/Skeleton/skeleton.tscn")
@onready var animation_world: AnimationPlayer = $Animation_World

func _ready() -> void:
	animation_world.play("Fade_In_World")
	CurrentZone.SetZone(self.name)

	#await get_tree().create_timer(2).timeout
	#Dialogic.start_timeline("Intro")


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


func _on_animation_world_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fade_In_World":
		animation_world.play("Ciclo General")
	pass # Replace with function body.
