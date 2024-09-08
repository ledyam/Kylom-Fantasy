extends PanelContainer
@onready var comer: AudioStreamPlayer2D = $Comer


@onready var contador: Label = $Contador
var is_vacio : bool = true
var cantidad : int = 0 
var item : Dictionary:
	set(value):
		item = value
		if item.is_empty() :
			$Icon.texture = null
			
		else:
			$Icon.texture = load(item["Texture"])

func _on_mouse_entered() -> void:
	if item.is_empty() : 
		owner.Normality()
		
	else : 
		owner.set_description(item)
	pass 
	
	#Metodo para Actualizar Etiqueta de cantidades 
func Actualizar_Etiqueta():
	if cantidad != 0 : 
		contador.visible = true
		contador.text = "x"+ str(cantidad)
	else : contador.visible = false

#Accion de usar objeto Consumible del Inventario 
func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if !self.item.is_empty():
			print("sumando Vida")
			CentralSignal.UsarObjeto.emit(item["Health_give"])
			cantidad -= 1
			Actualizar_Etiqueta()
			comer.play()
			if cantidad == 0 :
				self.item.clear()
				is_vacio = true
				$Icon.texture = null
				owner.Normality()
	
	pass # Replace with function body.
