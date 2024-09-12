extends Control


func _ready() -> void:
	self.text = owner.name + " Lv." + str(owner.current_level)
	
func Actualizar():
	self.text = owner.name + " Lv." + str(owner.current_level)
