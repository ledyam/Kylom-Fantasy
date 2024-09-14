extends CharacterBody2D
class_name Player 

#Variables Atributos Principales Genéricos
var current_level : int = 1 
const MAX_LEVEL : int = 20
var Label_Name_Level = load("res://UI/Indicadores/indicador_level.tscn")
var vida_actual : float  = 100
var vida_Max : float = 100 

#Variables STATS
var Fuerza  : int = 5
var Agilidad: int = 5
var Carisma : int = 5

#PlUS
var numero_flotante : PackedScene = load("res://UI/Indicadores/numero_flotante.tscn")


#region SEÑALES
signal Lose_Life (life: float)
signal Give_life(life:float)
signal Give_EXP (exp : int )

#endregion
 
func _ready() -> void:
	CentralSignal.connect("UsarObjeto",on_RecibirVida)





func on_RecibirVida(vida):
	vida_actual += vida
	if vida_actual <= vida_Max:
		print(vida_actual)
		Give_life.emit(vida_actual)
	else : 
		vida_actual = vida_Max
		Give_life.emit(vida_actual)
		
