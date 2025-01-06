extends NinePatchRect


@onready var fuerza_value: Label = $Panel/AtributosValues/FuerzaValue
@onready var destreza_value: Label = $Panel/AtributosValues/DestrezaValue
@onready var inteligencia_value: Label = $Panel/AtributosValues/InteligenciaValue
@onready var suerte_value: Label = $Panel/AtributosValues/SuerteValue
@onready var puntos_restantes: Label = $Panel/PuntosValue


	


	
	
	


	
func DecrementarPuntosRestantes():
	if puntos_restantes.text.to_int() > 0 : 
		var value = puntos_restantes.text.to_int()
		value -= 1 
		puntos_restantes.text = str(value)

func IncrementarPuntosRestantes(incremento : int ):

	var value = puntos_restantes.text.to_int()
	value += incremento
	puntos_restantes.text = str(value)
	


func IncrementarAtributo(atributo : Label) : 
	if puntos_restantes.text != "0":
		var value = atributo.text.to_int()
		value += 1 
		atributo.text = str(value)
	
func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("Personaje"):
		if self.visible == true:
			self.hide()
		else : self.visible = true 


func _on_fuerza_button_pressed() -> void:
	IncrementarAtributo(fuerza_value)
	DecrementarPuntosRestantes()
	owner.player.stats.ATK += 10
	pass # Replace with function body.


func _on_destreza_button_pressed() -> void:
	IncrementarAtributo(destreza_value)
	DecrementarPuntosRestantes()
	pass # Replace with function body.


func _on_inteligencia_button_pressed() -> void:
	IncrementarAtributo(inteligencia_value)
	DecrementarPuntosRestantes()
	pass # Replace with function body.


func _on_suerte_button_pressed() -> void:
	IncrementarAtributo(suerte_value)
	DecrementarPuntosRestantes()
	pass # Replace with function body.
