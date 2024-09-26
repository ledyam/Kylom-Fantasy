extends Player
class_name MainPlayer


#region VARIABLES ESTADISTICAS
# Variables Generales
const NOMBRE = "Marcus"
var vida_actual : float  = 100 :
	set(value):
		if value <= 0 :
			vida_actual = 0
			player_ui.progress_bar.value = value
			player_ui.indicador_vida.text = str(0) + "|" + str(vida_Max)
			
		elif value > 0  :
				vida_actual = value
				if vida_actual > vida_Max:
					vida_actual = vida_Max
				player_ui.progress_bar.value = vida_actual
				player_ui.indicador_vida.text = str(vida_actual) + "|" + str(vida_Max) 
var vida_Max : float = 100 :
	set(value):
		vida_Max = value
		player_ui.progress_bar.max_value = value
var current_Exp : float  : 
	set(value):
		current_Exp = value 
		player_ui.progress_bar_exp.value = value
		player_ui.indicador_exp.text = str(value) + "|" + str(Max_Exp) 
var Max_Exp : float = 50:
	set(value):
		Max_Exp = value
		player_ui.progress_bar_exp.max_value = value
var current_level : int = 1 :
	
	set(value):
		current_level = value 
		indicador_nombre_level.text = NOMBRE + " Lv." + str(current_level)



var ATK :  float = 100
var DEF : float = 20
#endregion


#region VARIABLES INSTANCIADAS 
@onready var mru_2d: MRU2D = $MRU2D
@export var current_direction: PlayerDirection = direction.none
@onready var cd: Timer = $Timers/CD
@onready var animated_player_movement: AnimationPlayer =$AnimationPlayerMovements
@onready var animated_sprite_2d1: AnimatedSprite2D =$AnimatedSprite2D
@onready var player_ui: Control = $"Player_UI"
@onready var ui_menu_in_game: Control = $UI_Menu_InGame
@onready var indicador_nombre_level: Label = $Indicador_nombre_level
#endregion

#region CONSTANTES 
const states : Dictionary = {
	#MOVIMIENTO
	'_walk':'Walk',
	'_idle' : 'Idle',
	'_atack': 'Attack',
	'_dead' : "Dead",
	'_damage' : "Damage",
}
const animations : Dictionary = {
	
	_idle = 'Player_idle_down',
	_idle_turnL = 'Player_idle_left',
	_idle_turnR = 'Player_idle_right',
	_idle_up = 'Player_idle_up',
	_walkr =  'Player_walk_right',
	_walkl =  'Player_walk_left',
	_walk_down = 'Player_walk_down',
	_walk_up = 'Player_walk_up',
	_attack = 'Player_attack_down',
	_attack_up = 'Player_attack_up',
	_attack_turnL = 'Player_attack_left',
	_attack_turnR = 'Player_attack_right',
	_hit_down = 'Player_hit_down',
	_hit_up = 'Player_hit_up',
	_hit_left = 'Player_hit_left',
	_hit_right = 'Player_hit_right',
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
		vida_actual -= enemy_attack
		spawn_numero_flotante(enemy_attack)
		Hit_Damage.emit()
		cooldown_Rdamage = false 
		cd.start()
	pass
func on_RecibirVida(vida):
	vida_actual += vida
func Give_Experiencia (exp_recive : int ): 
	if(player_ui.progress_bar_exp.value + exp_recive) > player_ui.progress_bar_exp.max_value:
		var resto = (player_ui.progress_bar_exp.value + exp_recive) - player_ui.progress_bar_exp.max_value
		LEVEL_UP()
		Max_Exp = LocalDatabase.content[str(current_level)]["Exp_Necesaria"]
		current_Exp = 0 
		current_Exp += resto
	else : 
		current_Exp += exp_recive
func LEVEL_UP ():
	current_level += 1
	vida_Max += 10
	vida_actual = vida_Max
	$"Sounds/LevelUpPickup(rpg)".play()
	pass



#region ALERTA DE SEÑALES
func _on_timer_timeout() -> void:
	queue_free()
	owner.get_tree().reload_current_scene()
	pass 

 

#region Timers

func _on_cd_timeout() -> void:
	cooldown_Rdamage = true
	recibir_damage = false
	velocity = Vector2.ZERO
	pass 
	
#endregion

	pass
	
	
	
#region Señales
#PRUEBA DE FUEGO



#SEÑAL Principal de ENTRADA HITBOX PLAYER
func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is EnemyOriginal and vida_actual > 0:
		recibir_damage = true
		cooldown_Rdamage = true
#Asiganción de Empuje al Recibir Daño
		knockback = (self.global_position - body.position).normalized() 
		velocity = knockback * 20
		
		
		
		Recibir_damage(body.ATK) #------Temporal para Cambios
		
		$"Sounds/Leap(gj3)".play()
	
	if body is ObjetoFisico: 
		ui_menu_in_game.inventario.add_item(body.Stats)
		body.queue_free()
		
#SEÑAL Principal de SALIDA  HITBOX PLAYER
func _on_hit_box_body_exited(body: Node2D) -> void:
	if body.name == "Skeleton":
		recibir_damage = false
		cooldown_Rdamage = false 
	pass 
	
#Señal para Realizar Daño
func _on_damage_box_body_entered(body: Node2D) -> void:
	if body as EnemyOriginal:
		body.EffectiveDamage(ATK)
	pass 
	
#endregion
func Moverrrrrrr():
	pass
