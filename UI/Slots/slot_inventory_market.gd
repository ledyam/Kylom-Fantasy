extends Control

@onready var contador: Label = $Contador

var is_vacio : bool = true
var cantidad : int = 0 :
	set(value):
		cantidad = value
		contador.text = "x" + str(cantidad)
		if cantidad != 0 and cantidad != 1 :
			contador.visible = true
		else : contador.visible = false
		
var item : Item:
	set(value):
		item = value
		if item == null :
			$CenterContainer/Icon.texture = null
		else:
			$CenterContainer/Icon.texture = item.texture




#Accion de usar objeto Consumible del Inventario 
func _on_gui_input(event: InputEvent) -> void:
	pass
