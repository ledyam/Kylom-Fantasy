extends Node2D

var ENEMYS : Dictionary = {
	1 : "res://Data/Enemyss/Skeleton/skeleton.tscn",
	2 : "res://Data/Enemys/Slime/slime.tscn",
	3 : "res://Data/Enemys/Goblin/goblin.tscn"
}
var enemy
@onready var animation_world: AnimationPlayer = $Animation_World

func _ready() -> void:
	animation_world.play("Fade_In_World")
	CurrentZone.SetZone(self.name)
	
	

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Morir"):
		enemy = load(ENEMYS[2])   # randi_range(1, 3)
		var ske = enemy.instantiate()
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
