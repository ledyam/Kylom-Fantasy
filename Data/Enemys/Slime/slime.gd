extends "res://Data/Enemys/EnemyOrignal.gd"

@onready var anim_enemy: AnimationPlayer = $AnimationEnemy
@export var Patrullaje : Node2D

const NOMBRE : String = "Slime"
var player = null
var on_area : bool = false 
var is_dead : bool = false 
var can_jump = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as MainPlayer :
		player = body 
		on_area = true
		
		print ("Entrando en señal")


func _on_area_2d_body_exited(_body: Node2D) -> void:
	on_area = false 

	print ("Saliendo de señal")
	pass # Replace with function body.



	
