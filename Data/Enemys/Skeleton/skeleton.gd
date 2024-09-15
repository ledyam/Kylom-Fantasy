extends EnemyOriginal
class_name Undead_Enemy



var Item : PackedScene= load("res://Data/Objects/objeto.tscn")
@onready var state_machine: Node = $StateMachine
@onready var anim_enemy: AnimatedSprite2D = $AnimatedSprite2D
@onready var damage: AudioStreamPlayer2D = $damage
@export var Patrullaje : Node2D

const NOMBRE : String = "Skeleto"
var player = null
var on_area : bool = false 
var is_dead : bool = false 


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
	
	
	
	
	var temporal_item = Item.instantiate()
	temporal_item.global_position = self.global_position
	temporal_item.Stats = loot.duplicate()
	get_tree().current_scene.add_child(temporal_item)
	queue_free()

	


	pass # Replace with function body.
