extends CharacterBody2D
class_name Player 

#Variables Atributos Principales Genéricos
var current_level : int = 1 
const MAX_LEVEL : int = 20




#Variables STATS
var Fuerza  : int = 5
var Agilidad: int = 5
var Carisma : int = 5

#PlUS
var numero_flotante : PackedScene = load("res://UI/Indicadores/numero_flotante.tscn")

#region SEÑALES
signal Give_EXP (exp : int )
#endregion
 
func spawn_numero_flotante(damage): 
	var number = numero_flotante.instantiate()
	number.position = global_position
	number.find_child("Label").text = "%.2f" % damage
	number.find_child("AnimationPlayer").play("normal")
	get_tree().current_scene.add_child(number)
