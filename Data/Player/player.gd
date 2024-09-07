extends CharacterBody2D
class_name MainPlayer


#region VARIABLES ESTADISTICAS
const NOMBRE = "Marcus"
var level : int = 1 
var vida_actual : float  = 100
var vida_Max : float = 100 
var attack :  int = 50 
#endregion
	



#region VARIABLES De Control
var can_attack : bool = true
var can_move : bool = true 
var direction : PlayerDirections = PlayerDirections.new()
var recibir_damage = false
var cda = false
var knockback = Vector2.ZERO

#endregion
var  numero_flotante : PackedScene = load("res://UI/Indicadores/numero_flotante.tscn")

#region VARIABLES INSTANCIADAS 
@onready var mru_2d: MRU2D = $MRU2D
@export var current_direction: PlayerDirection = direction.none
@onready var cd: Timer = $Timers/CD
@onready var animated_sprite_2d: AnimationPlayer =$AnimationPlayerMovements
@onready var animated_sprite_2d1: AnimatedSprite2D =$AnimatedSprite2D
@onready var leap_gj_3_: AudioStreamPlayer = $"Sounds/Leap(gj3)"
@onready var diurn: Control = $Diurn
@onready var player_ui: Control = $"Player UI"
@onready var ui_menu_in_game: Control = $UI_Menu_InGame


#endregion

#region SEÑALES
signal Lose_Life (life: float)
signal Give_life(life:float)
#endregion
 
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
#endregion


#region FUNCIONES del Engine

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _ready() -> void:
	CentralSignal.connect("UsarObjeto",on_RecibirVida)

	
	#endregion

#region MÉTODOS del Player
func Recibir_damage(enemy_Atack : float):
	if recibir_damage and cda:
		vida_actual-= enemy_Atack
		Lose_Life.emit(vida_actual)
		spawn_numero_flotante(enemy_Atack)
		cda = false 
		cd.start()
	pass
	
func spawn_numero_flotante(damage ): 
	var number = numero_flotante.instantiate()
	number.position = global_position
	number.find_child("Label").text = "%.2f" % damage
	number.find_child("AnimationPlayer").play("normal")
	get_tree().current_scene.add_child(number)

#region ALERTA DE SEÑALES
func _on_timer_timeout() -> void:
	queue_free()
	
	owner.get_tree().reload_current_scene()
	pass 



	
	pass 

#TIMERS
func _on_cd_timeout() -> void:
	cda = true
	recibir_damage = false
	velocity = Vector2.ZERO
	pass 
	
#Señal Conectada desde Nodo Lejano
func on_RecibirVida(vida):
	vida_actual += vida
	if vida_actual <= vida_Max:
		print(vida_actual)
		Give_life.emit(vida_actual)
	else : 
		vida_actual = vida_Max
		Give_life.emit(vida_actual)
		
	pass
#Señales de Áreas del Personaje
#SEÑAL Principal de ENTRADA HITBOX PLAYER
func _on_hit_box_body_entered(body: Node2D) -> void:
	if body as EnemyOriginal and vida_actual > 0:
		recibir_damage = true
		cda = true
#Asiganción de Empuje al Recibir Daño
		knockback = (self.global_position - body.position).normalized() 
		velocity = knockback * 20
		Recibir_damage(body.ATK) #------Temporal para Cambios
		leap_gj_3_.play()
		
	if body as ObjetoFisico: 
		ui_menu_in_game.inventario.add_item(body.Stats)
		body.queue_free()
		
#SEÑAL Principal de SALIDA  HITBOX PLAYER
func _on_hit_box_body_exited(body: Node2D) -> void:
	if body.name == "Skeleton":
		recibir_damage = false
		cda = false 
	pass 
	
	
#Señal para Ofertar Daño
func _on_damage_box_body_entered(body: Node2D) -> void:
	if body as EnemyOriginal:
		body.EffectiveDamage(attack)
	pass 
	
	
#endregion
