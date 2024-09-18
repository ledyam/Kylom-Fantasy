extends Player
class_name MainPlayer


#region VARIABLES ESTADISTICAS
# Variables Generales
const NOMBRE = "Marcus"
var vida_actual : float  = 100 :
	set(value):
		if value < 0 : 
			vida_actual = value
			player_ui.progress_bar.value = value
			player_ui.indicador_vida.text = str(value) + "|" + str(vida_Max)
		else : 
			player_ui.indicador_vida.text = str(0) + "|" + str(vida_Max)
		
var current_Exp : float  : 
	set(value):
		current_Exp = value 
		player_ui.progress_bar_exp.value = value
		player_ui.indicador_exp.text = str(value) + "|" + str(Max_Exp) 
var Max_Exp : float = 50:
	set(value):
		Max_Exp = value
		player_ui.progress_bar_exp.max_value = value
var vida_Max : float = 100 :
	set(value):
		vida_Max = value
		player_ui.progress_bar_exp.max_value = value
		
var ATK :  float = 100
var DEF : float = 20
#endregion

#region VARIABLES De Control

var can_attack : bool = true
var can_move : bool = true 
var direction : PlayerDirections = PlayerDirections.new()
var recibir_damage = false
var cooldown_Rdamage = false
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
	
	_idle = 'Player_idle',
	_idle_turnL = 'Player_idle_turn_left',
	_idle_turnR = 'Player_idle_turn_right',
	_idle_up = 'Player_idle_up',
	_walkr =  'Player_walk_right',
	_walkl =  'Player_walk_left',
	_walk_down = 'Player_walk_down',
	_walk_up = 'Player_walk_up',
	_attack = 'Player_attack_down',
	_attack_up = 'Player_attack_up',
	_attack_turnL = 'Player_attack_turn_left',
	_attack_turnR = 'Player_attack_turn_right',
	_dead  = 'Player_dead'
}

#endregion


#region FUNCIONES del Engine
func _ready() -> void:
	CentralSignal.connect("UsarObjeto",on_RecibirVida)
	
	
func _physics_process(_delta: float) -> void:
	move_and_slide()


#endregion

#region MÉTODOS del Player
func Recibir_damage(enemy_attack : float):
	if recibir_damage and cooldown_Rdamage:
		vida_actual-= enemy_attack
		spawn_numero_flotante(enemy_attack)
		cooldown_Rdamage = false 
		cd.start()
	pass
	
	
func on_RecibirVida(vida):
	vida_actual += vida
	
func Give_Exp(exp : int ): 
	if(player_ui.progress_bar_exp.value + exp) > player_ui.progress_bar_exp.max_value:
		var resto = (player_ui.progress_bar_exp.value + exp) - player_ui.progress_bar_exp.max_value
		LEVEL_UP()
		Max_Exp = LocalDatabase.content[str(current_level)]["Exp_Necesaria"]
		current_Exp = 0 
		current_Exp += resto
	else : 
		current_Exp += exp
		

func LEVEL_UP ():
	current_level += 1
	vida_Max += 10
	vida_actual = vida_Max
	$"Sounds/LevelUpPickup(rpg)".play()
	indicador_nombre_level.Actualizar()



#region ALERTA DE SEÑALES
func _on_timer_timeout() -> void:
	queue_free()
	owner.get_tree().reload_current_scene()
	pass 

 

#TIMERS
func _on_cd_timeout() -> void:
	cooldown_Rdamage = true
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
		cooldown_Rdamage = true
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
		cooldown_Rdamage = false 
	pass 
#Señal para Ofertar Daño
func _on_damage_box_body_entered(body: Node2D) -> void:
	if body as EnemyOriginal:
		body.EffectiveDamage(ATK)
	pass 
	

#endregion
