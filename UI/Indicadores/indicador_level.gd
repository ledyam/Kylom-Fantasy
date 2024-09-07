extends Control


func _ready() -> void:
	self.text = owner.name + " Lv." + str(owner.level)
	
