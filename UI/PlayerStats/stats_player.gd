extends NinePatchRect


@onready var fuerza_value: Label = $AtributosValues/FuerzaValue
@onready var destreza_value: Label = $AtributosValues/DestrezaValue
@onready var inteligencia_value: Label = $AtributosValues/InteligenciaValue
@onready var suerte_value: Label = $AtributosValues/SuerteValue
@onready var puntos_restantes: Label = $PuntosValue


func _process(_delta: float) -> void:
	if PuedeIncrementar():
		$IncrementBottons.show()
	else : $IncrementBottons.hide()

func IncrementarPuntosRestantes(incremento : int ):
	var value = puntos_restantes.text.to_int()
	value += incremento
	puntos_restantes.text = str(value)

func DecrementarPuntosRestantes():
	if puntos_restantes.text.to_int() > 0 : 
		var value = puntos_restantes.text.to_int()
		value -= 1 
		puntos_restantes.text = str(value)


func IncrementarAtributo(atributo : Label) : 
		var value = atributo.text.to_int()
		value += 1 
		atributo.text = str(value)


func PuedeIncrementar() -> bool: 
	return  puntos_restantes.text != "0"

#region SEÑALES DE INCREMENTO
func _on_fuerza_button_pressed() -> void:
	if PuedeIncrementar():
		IncrementarAtributo(fuerza_value)
		DecrementarPuntosRestantes()
		owner.player_reference.stats.ATK += 10
	
	

func _on_destreza_button_pressed() -> void:
	if PuedeIncrementar():
		IncrementarAtributo(destreza_value)
		DecrementarPuntosRestantes()
	


func _on_inteligencia_button_pressed() -> void:
	if PuedeIncrementar():
		IncrementarAtributo(inteligencia_value)
		DecrementarPuntosRestantes()
	pass # Replace with function body.


func _on_suerte_button_pressed() -> void:
	if PuedeIncrementar():
		IncrementarAtributo(suerte_value)
		DecrementarPuntosRestantes()
	pass # Replace with function body.
#endregion
