extends CharacterBody2D
class_name MainPlayer


#region VARIABLES Simples
const NOMBRE = "Marcus"
var vida : int = 400
var puede_atacar : bool = true
var direction : PlayerDirections = PlayerDirections.new()
var recibir_damage = false
var cda = false
var knockback = Vector2.ZERO

@onready var mru_2d: MRU2D = $MRU2D
@export var current_direction: PlayerDirection = direction.none
@onready var cd: Timer = $CD
@onready var animated_sprite_2d: AnimationPlayer = $AnimationPlayerMovements
@onready var animated_sprite_2d1: AnimatedSprite2D = $AnimatedSprite2D
@onready var leap_gj_3_: AudioStreamPlayer = $"Leap(gj3)"

@onready var diurn: Control = $Diurn
signal Quitar_corazon

 
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
		emit_signal("Quitar_corazon")
		vida -= 100
		print ("100 puntos de daño recibido")
		cda = false 
		cd.start()


func _physics_process(delta: float) -> void:
	if vida > 0 :
		if recibir_damage:
			Recibir_damage()
		move_and_slide()
	else :
		cda = false
		recibir_damage = false
		
func _on_timer_timeout() -> void:
	queue_free()
	owner.get_tree().reload_current_scene()
	pass # Replace with function body.
	

	


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body as EnemyCharacter and vida > 0:
		recibir_damage = true
		cda = true
		knockback = (self.global_position - body.position).normalized() 
		velocity = knockback * 12
		leap_gj_3_.play()
	
	


func _on_hit_box_body_exited(body: Node2D) -> void:
	if body.name == "Skeleton":
		recibir_damage = false
		cda = false 
	pass # Replace with function body.


func _on_cd_timeout() -> void:
	cda = true
	velocity = Vector2.ZERO
	pass # Replace with function body.
