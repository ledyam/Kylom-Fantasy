extends Player
class_name MainPlayer


#region VARIABLES ESTADISTICAS
# Variables Generales
const NOMBRE = "Marcus"

var ATK :  float = 100
var DEF : float = 20


#endregion

#region VARIABLES De Control
var can_attack : bool = true
var can_move : bool = true 
var direction : PlayerDirections = PlayerDirections.new()
var recibir_damage = false
var cda = false
var knockback = Vector2.ZERO
#endregion
#region VARIABLES INSTANCIADAS 
@onready var mru_2d: MRU2D = $MRU2D
@export var current_direction: PlayerDirection = direction.none
@onready var cd: Timer = $Timers/CD
@onready var animated_sprite_2d: AnimationPlayer =$AnimationPlayerMovements
@onready var animated_sprite_2d1: AnimatedSprite2D =$AnimatedSprite2D
@onready var player_ui: Control = $"Player_UI"
@onready var ui_menu_in_game: Control = $UI_Menu_InGame
@onready var indicador_nombre_level: Label = $Indicador_nombre_level


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
	
func Give_Exp(exp : int ): 
	Give_EXP.emit(exp)
	
func LEVEL_UP ():
	current_level +=1
	vida_Max += 10
	vida_actual = vida_Max
	player_ui.Actualizar_Label_UI_Life()
	$"Sounds/LevelUpPickup(rpg)".play()
	indicador_nombre_level.Actualizar()
	
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
		$"Sounds/Leap(gj3)".play()
	
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
		body.EffectiveDamage(ATK)
	pass 
	

#endregion
