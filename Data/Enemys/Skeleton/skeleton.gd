extends MobEnemy
class_name Undead_Enemy

@onready var anim_enemy: AnimatedSprite2D = $AnimatedSprite2D
@export var Patrullaje : Node2D

const NOMBRE : String = "Skeleto"



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as MainPlayer :
		player = body 
		on_area = true
		print ("Entrando en señal")


func _on_area_2d_body_exited(_body: Node2D) -> void:
	on_area = false 
	player = null
	print ("Saliendo de señal")
	pass # Replace with function body.
