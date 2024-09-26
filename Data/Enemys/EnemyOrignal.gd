extends CharacterBody2D

class_name EnemyOriginal
var life : float = 100
var type : String
var ATK : float  = 20
var can_critic : bool = false  
var current_level : int = 1
var  loot : Dictionary = {}
var Item : PackedScene= load("res://Data/Objects/objeto.tscn")

@export_range(0,1) var critic_chance : float
@export var  DEF : float
var  numero_flotante : PackedScene = load("res://UI/Indicadores/numero_flotante.tscn")

signal Take_Damage

func _ready() -> void:
	randomize()
	var file = FileAccess.open("res://DataBase/Local/Item_Equipable.json", FileAccess.READ)
	if FileAccess.file_exists("res://DataBase/Local/Item_Equipable.json"):
		var temp_loot : Dictionary = JSON.parse_string(file.get_as_text())
		Item_Probabilidad(temp_loot)
				 
func Item_Probabilidad(temp_loot : Dictionary):
	var total_drop : float = 0.0
	var random : float = 0.0
	for i in temp_loot:
		total_drop += temp_loot[str(i)]["Drop"]
	random = randf() * total_drop
	var acumulador : float = 0.0
	for i in temp_loot :
		acumulador += temp_loot[str(i)]["Drop"]
		if random <= acumulador:
			loot = temp_loot[str(i)].duplicate(true)
			break
func spawn_numero_flotante(damage ): 
	var number = numero_flotante.instantiate()
	number.position = global_position
	number.find_child("Label").text = "%.2f" % damage
	if can_critic :
		number.find_child("AnimationPlayer").play("critico")
	else:
		number.find_child("AnimationPlayer").play("normal")
	get_tree().current_scene.add_child(number)
#region FUNCIONES Para Daño
func EffectiveDamage(give_attack : float):
	var damage 
	damage =  give_attack * Defense(give_attack) * Aleatorio() *Critico(critic_chance)
	print (damage , " de daño RECIBIDO")
	life -= damage
	spawn_numero_flotante(damage)
	Take_Damage.emit()
func Aleatorio ():
	return randf_range(0.9 , 1.0)
func Defense (give_attack : float):
	if give_attack == 0 and DEF == 0 : 
		return 0.0
		
	else : return(give_attack / (give_attack+DEF))
	
func Critico(chance):
	var num = randf_range(1,0)
	
	if num < chance:
		can_critic = true
		return 2.0
	else:
		can_critic = false 
		return 1.0

#endregion
