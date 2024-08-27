extends CharacterBody2D
class_name MainPlayer


#region VARIABLES Simples
const NOMBRE = "Marcus"
var vida : int = 100 
var puede_atacar : bool = true
var direction : PlayerDirections = PlayerDirections.new()
var recibir_damage = false
var cda = false
var collision_normal
@onready var mru_2d: MRU2D = $MRU2D
@export var current_direction: PlayerDirection = direction.none
@onready var cd: Timer = $CD
@onready var animated_sprite_2d: AnimationPlayer = $AnimationPlayerMovements


 
#region CONSTANTES 
const states : Dictionary = {
	#MOVIMIENTO
	'_walk':'PlayerWalk',
	'_idle' : 'PlayerIdle',
	'_atack': 'PlayerAtack',
	'_dead' : "PlayerDead"
}
const animations : Dictionary = {
	'_idle': 'Player_idle',
	'_idle_turnL':'Player_idle_turn_left',
	'_idle_turnR':'Player_idle_turn_right',
	'_idle_up':'Player_idle_up',
	'_walkr': 'Player_walk_right',
	'_walkl': 'Player_walk_left',
	'_walk_down':'Player_walk_down',
	'_walk_up':'Player_walk_up',
	'_attack':'Player_attack_down',
	'_attack_up':'Player_attack_up',
	'_attack_turnL':'Player_attack_turn_left',
	'_attack_turnR':'Player_attack_turn_right',
	'_dead' : 'Player_dead'
	}





func Recibir_damage():
	if recibir_damage and cda:
		vida -= 20
		print ("20 puntos de daño recibido")
		cda = false 
		cd.start()
		


func _physics_process(delta: float) -> void:
	
	if recibir_damage:
		Recibir_damage()

func _on_timer_timeout() -> void:
	queue_free()
	owner.get_tree().reload_current_scene()
	pass # Replace with function body.
	

	


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body as EnemyCharacter:
		
		recibir_damage = true
		cda = true
		move_and_slide()
	
	


func _on_hit_box_body_exited(body: Node2D) -> void:
	if body.name == "Skeleton":
		recibir_damage = false
		cda = false 
	pass # Replace with function body.


func _on_cd_timeout() -> void:
	cda = true
	pass # Replace with function body.
