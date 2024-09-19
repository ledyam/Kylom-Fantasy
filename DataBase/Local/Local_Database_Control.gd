extends Node


var content : Dictionary

func _ready() -> void:

	var file = FileAccess.open("res://DataBase/Local/Level_Exp.json", FileAccess.READ)
	content = JSON.parse_string(file.get_as_text())
	file.close()
	
	DataBase.data_type = "Item"


	
