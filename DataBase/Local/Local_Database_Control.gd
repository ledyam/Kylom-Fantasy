extends Node


var content : Dictionary

func _ready() -> void:
	
	var file = FileAccess.open("res://DataBase/Local/Level_Exp.json", FileAccess.READ)
	content = JSON.parse_string(file.get_as_text())
	file.close()

	file = FileAccess.open("res://DataBase/Local/Item3.json",FileAccess.WRITE)
	file.store_string(JSON.stringify(content,'\t',true,true))
