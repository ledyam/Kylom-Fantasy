extends Node2D

var ENEMYS : Dictionary = {
	1 : "res://Data/Enemys/Goblin/goblin 2.0.tscn",
}
var enemy
@onready var animation_world: AnimationPlayer = $Animation_World

func _ready() -> void:
	animation_world.play("Fade_In_World")
	
	

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Instantiation"):
		enemy = load(ENEMYS[1])  
		var ske = enemy.instantiate()
		ske.global_position = Vector2(randf_range(50,400), randf_range(-50 , 50))
		add_child(ske)
	pass

	


func _on_animation_world_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fade_In_World":
		animation_world.play("Ciclo General")
	pass # Replace with function body.
