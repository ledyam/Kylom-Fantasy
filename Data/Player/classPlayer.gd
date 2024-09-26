extends CharacterBody2D
class_name Player 
#Variables de Control

#region VARIABLES De Control
var direction : PlayerDirections = PlayerDirections.new()
var recibir_damage = false
var cooldown_Rdamage = false
var knockback = Vector2.ZERO
var can_attack : bool = true
var can_move : bool = true 
#endregion

#Variables Atributos Principales Genéricos

const MAX_LEVEL : int = 20

#Variables STATS
var Fuerza  : int = 5
var Agilidad: int = 5
var Carisma : int = 5

#PlUS
var numero_flotante : PackedScene = load("res://UI/Indicadores/numero_flotante.tscn")

#region SEÑALES
signal Hit_Damage
#endregion
 
func spawn_numero_flotante(damage): 
	var number = numero_flotante.instantiate()
	number.position = global_position
	number.find_child("Label").text = "%.2f" % damage
	number.find_child("AnimationPlayer").play("normal")
	get_tree().current_scene.add_child(number)
