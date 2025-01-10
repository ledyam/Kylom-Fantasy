extends CharacterBody2D

@export var mercado : PackedScene 
var money : int 


func  _ready() -> void:
	money = (randi_range(300 , 500))
	Dialogic.connect("signal_event", OpenMarket)
	
func OpenMarket(argument : String):
	if (argument == "Open Market"):
		get_tree().paused = true
		var abrir_mercado = mercado.instantiate()
		self.add_child(abrir_mercado)
		
		
		


func _on_area_2d_mouse_entered() -> void:
	Dialogic.start("Compra_Venta")
	pass # Replace with function body.
