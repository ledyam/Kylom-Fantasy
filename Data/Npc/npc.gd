extends CharacterBody2D
class_name NPC
var player : CharacterBody2D
var player_on : bool = false
var LIFE = 100
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var  numero_flotante : PackedScene = load("res://UI/Indicators/numero_flotante.tscn")
@onready var area_2d: Area2D = $Area2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D




func _ready() -> void:
	$Area2D.set_deferred("monitoring", false)





const BULLET : PackedScene = preload("res://Data/Npc/bullet.tscn")

func EffectiveDamage(give_attack : float):
	var damage 
	damage =  give_attack
	print ("%.2f" % damage , " de daño RECIBIDO")
	LIFE -= damage
	spawn_numero_flotante(damage)
	
func spawn_numero_flotante(damage ): 
	var number = numero_flotante.instantiate()
	number.position = global_position
	number.find_child("Label").text = "%.2f" % damage

	number.find_child("AnimationPlayer").play("normal")
	number.z_index = 4 
	get_tree().current_scene.add_child(number)


func Disparar():
	var bullet = BULLET.instantiate()
	bullet.position = $Marker2D.global_position
	bullet.z_index = 20
	get_tree().current_scene.add_child(bullet)
	
func DispararULTI():
	var bullet = BULLET.instantiate()
	bullet.position = $Marker2D.global_position
	bullet.z_index = 20
	bullet.CambiarAnim()
	get_tree().current_scene.add_child(bullet)
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is MainPlayer:
		player_on = true
	pass # Replace with function body.
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is MainPlayer:
		player_on = false
	pass # Replace with function body.


	pass # Replace with function body.
