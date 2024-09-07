extends NinePatchRect
@onready var coger_objeto: AudioStreamPlayer2D = $CogerObjeto
func add_item (item) :
	var aux : Dictionary = item
	var index = self.find_child("GridContainer")
	
	for i in index.get_children():
		
		if !i.is_vacio and i.item == aux :
			i.cantidad += 1
			i.Actualizar_Etiqueta()
			coger_objeto.play()
			break
		
		if i.is_vacio:
			i.item = aux
			i.is_vacio = false
			i.cantidad += 1
			coger_objeto.play()
			break
