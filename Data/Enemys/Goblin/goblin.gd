
class_name Humanoid extends "res://Data/Enemys/Generic/mob_enemy.gd"


@onready var anim_enemy: AnimationPlayer = $AnimationEnemy
@export var Patrullaje : Node2D


const NOMBRE : String = "Goblin"




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as MainPlayer :
		player = body 
		on_area = true


func _on_area_2d_body_exited(_body: Node2D) -> void:
	on_area = false 
	pass # Replace with function body.


func _on_attack_area_area_entered(area: Area2D) -> void:
	if area.name == "hit_box" :
		area.owner.Recibir_damage(ATK)
		

	pass # Replace with function body.


func _on_area_loot_mouse_entered() -> void:
	

	pass # Replace with function body.
