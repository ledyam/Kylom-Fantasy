extends Node


var content : Dictionary
var content1 : Dictionary
func _ready() -> void:
	#DataBase.connect("BDReady", DBReady)
	#DataBase.connect("Data_Ready", Item)
	var Level_EXP = FileAccess.open("res://DataBase/Local/Level_Exp.json", FileAccess.READ)
	content = JSON.parse_string(Level_EXP.get_as_text())
	Level_EXP.close()
	DataBase.data_type = "Item"
	
	
	
	#
#
#func DBReady():
	#DataBase.database.execute('SELECT "ID", "Name", "Texture", "Rarity", "Drop", "Stats", "Type", \
	 #"Description" FROM public."Item_Equipable";')
	#
	#
	#
#func Item ():
	#
	#var Item = FileAccess.open("res://DataBase/Local/Item_Equipable.json", FileAccess.WRITE)
	#Item.store_line(JSON.stringify(DataBase.Items_data,'\t'))
	#Item.close()
	#
	#Item = FileAccess.open("res://DataBase/Local/Item_Equipable.json", FileAccess.READ)
	#content1 = JSON.parse_string(Item.get_as_text())
	#print(content1)
