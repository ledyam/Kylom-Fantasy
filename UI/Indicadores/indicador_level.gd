extends Control


func _ready() -> void:
	self.text = owner.NOMBRE + " Lv." + str(owner.current_level)
	
func Actualizar():
	self.text = owner.NOMBRE + " Lv." + str(owner.current_level)
