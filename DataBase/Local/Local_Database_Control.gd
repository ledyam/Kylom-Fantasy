extends Node


var content : Dictionary

func _ready() -> void:
	DataBase.connect("Data_Ready",on_ready_data_DataBase)
	DataBase.connect("BDReady",on_ready_DataBase)
	var file = FileAccess.open("res://DataBase/Local/Level_Exp.json", FileAccess.READ)
	content = JSON.parse_string(file.get_as_text())
	file.close()
	
	DataBase.data_type = "Item"


func on_ready_DataBase():
	DataBase.database.execute('SELECT *
	FROM public."Item_Consumible";')

func on_ready_data_DataBase ():
		if DataBase.data_type == "Item":
			var file = FileAccess.open("res://DataBase/Local/Item_Loot.json",FileAccess.WRITE)
			file.store_string(JSON.stringify( DataBase.Items_data,'\t',true,true))
			DataBase.Clean_Library()
	
