
class_name MobEnemy extends CharacterBody2D 

#region VARIABLES Stats
var life : float = 100 : 
	set(value):
		life = value
		$mob_enemy_health_bar.find_child("ProgressBar").value = life
var current_level : int = 1
var ATK : float  = 20
var  DEF : float = 20 

var loot: Item

#region VARIABLES Control
var type : String
var can_critic : bool = false  
var is_alive : bool = true
var player = null # Referencia al Player
var on_area : bool = false
const MINIMUM_DISTANCE = 13 
@export_range(0,1) var critic_chance : float


#region VARIABLES Instancias 
var  numero_flotante : PackedScene = load("res://UI/Indicadores/numero_flotante.tscn")
var  item : PackedScene = load("res://Data/Items/item.tscn")



signal Take_Damage

func _ready() -> void:
	loot = GLOBAL.Asignar_Item()
	

func spawn_numero_flotante(damage ): 
	var number = numero_flotante.instantiate()
	number.position = global_position
	number.find_child("Label").text = "%.2f" % damage
	if can_critic :
		number.find_child("AnimationPlayer").play("critico")
	else:
		number.find_child("AnimationPlayer").play("normal")
	get_tree().current_scene.add_child(number)
	
	
#region FUNCIONES Control de Daño Recibido
func EffectiveDamage(give_attack : float):
	var damage 
	damage =  give_attack * Defense(give_attack) * Aleatorio() * Critico(critic_chance)
	print ("%.2f" % damage , " de daño RECIBIDO")
	life -= damage
	spawn_numero_flotante(damage)

	Take_Damage.emit()
func Aleatorio ():
	return randf_range(0.9 , 1.0)
func Defense (give_attack : float):
	if give_attack == 0 and DEF == 0 : 
		return 0.0
	else :
		return(give_attack / (give_attack+DEF))
func Critico(chance):
	var num = randf_range(1,0)
	
	if num < chance:
		can_critic = true
		return 2.0
	else:
		can_critic = false 
		return 1.0
#endregion
