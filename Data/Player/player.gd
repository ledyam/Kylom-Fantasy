extends Player
class_name MainPlayer

#region VARIABLES INSTANCIADAS 
var stats = Stats.new()
var abreviate = Abreviate.new()


@onready var mru_2d: MRU2D = $MRU2D
@export var current_direction: PlayerDirection = direction.none
@onready var cd: Timer = $Timers/CD
@onready var anim_movement: AnimationPlayer =$AnimationPlayerMovements
@onready var player_ui: Control = $"Player_UI"
@onready var general_menu: CanvasLayer = $UI_Menu_InGame
@onready var body_collision: CollisionShape2D = $Body_Collision




#endregion

#region FUNCIONES del Engine
func _ready() -> void:
	stats.player = self 
	CentralSignal.connect("UsarObjeto",on_RecibirVida)
	Dialogic.connect("signal_event", MOVING)
	Dialogic.connect("signal_event", NO_MOVING)
func _physics_process(_delta: float) -> void: 
		move_and_slide()

func MOVING (ar):
	if ar == "MOVING":
		is_moving = true
	
func NO_MOVING(ar):
	if ar == "NO_MOVING":
		is_moving = false
#endregion

#region MÉTODOS del Player
func Recibir_damage(enemy_attack : float):
	if recibir_damage and cooldown_Rdamage:
		stats.current_life-= enemy_attack
		spawn_numero_flotante(enemy_attack)
		Hit_Damage.emit()
		cooldown_Rdamage = false 
		cd.start()
	pass
func on_RecibirVida(vida):
	stats.current_life+= vida
func Give_Experiencia (exp_recive : int ): 
	if(player_ui.progress_bar_exp.value + exp_recive) >= player_ui.progress_bar_exp.max_value:
		var resto = (player_ui.progress_bar_exp.value + exp_recive) - player_ui.progress_bar_exp.max_value
		LEVEL_UP()
		stats.max_exp = LocalDatabase.content[str(stats.current_level)]["Exp_Necesaria"]
		stats.current_exp = 0 
		stats.current_exp += resto
	else : 
		stats.current_exp += exp_recive
func LEVEL_UP ():
	stats.current_level += 1
	stats.max_life += 10
	stats.current_life= stats.max_life
	general_menu.inventario.stats_player.IncrementarPuntosRestantes(3)
	$"Sounds/LevelUpPickup(rpg)".play()
	pass






#region Timers
func _on_cd_timeout() -> void:
	cooldown_Rdamage = true
	recibir_damage = false
	velocity = Vector2.ZERO
	pass 
	

func _on_timer_timeout() -> void:
	body_collision.disabled = true
	queue_free()
	owner.get_tree().reload_current_scene()
	pass 
	
#endregion

	pass
	
	
	
#region Señales

#SEÑAL Principal de ENTRADA HITBOX PLAYER
func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is MobEnemy and stats.current_life > 0:
		recibir_damage = true
		cooldown_Rdamage = true
		
#Asiganción de Empuje al Recibir Daño
		knockback = (self.global_position - body.position).normalized() 
		velocity = knockback * 20
		Recibir_damage(body.ATK) #------Temporal para Cambios
		$"Sounds/Leap(gj3)".play()


#SEÑAL Principal de SALIDA  HITBOX PLAYER
func _on_hit_box_body_exited(body: Node2D) -> void:
	if body is MobEnemy:
		recibir_damage = false
		cooldown_Rdamage = false 
	pass 
	
#Señal para Realizar Daño
func _on_damage_box_body_entered(body: Node2D) -> void:
	if body as MobEnemy:
		body.EffectiveDamage(stats.ATK)
		
	if body is NPC : 
		body.EffectiveDamage(stats.ATK)
	pass 
	
#endregion


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.name == "Enemy_Attack_Area" and stats.current_life > 0:
		
		recibir_damage = true
		cooldown_Rdamage = true
		knockback = (self.global_position + area.position).normalized() 
		velocity = knockback * 40
		Recibir_damage(area.owner.ATK) 
		
		


func _on_hit_box_area_exited(_area: Area2D) -> void:
	recibir_damage = true
	cooldown_Rdamage = true
	pass # Replace with function body.
