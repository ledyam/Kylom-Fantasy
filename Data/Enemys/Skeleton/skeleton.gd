extends EnemyOriginal
class_name Undead_Enemy


@onready var anim_enemy: AnimatedSprite2D = $AnimatedSprite2D
@onready var damage: AudioStreamPlayer2D = $damage
@export var Patrullaje : Node2D

var player = null
var on_area : bool = false 
var is_dead : bool = false 
var bounce_strength = 100


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




func _on_dead_timeout() -> void:
	queue_free()
	pass # Replace with function body.
