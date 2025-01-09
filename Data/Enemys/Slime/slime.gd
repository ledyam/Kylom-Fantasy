
class_name Trash extends "res://Data/Enemys/Generic/mob_enemy.gd"

@onready var anim_enemy: AnimationPlayer = $AnimationEnemy
@export var Patrullaje : Node2D

const NOMBRE : String = "Slime"

var can_jump = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as MainPlayer :
		player = body 
		on_area = true
func _on_area_2d_body_exited(_body: Node2D) -> void:
	on_area = false 
	pass # Replace with function body.
