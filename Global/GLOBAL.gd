extends Node

var loot : Dictionary

func _ready() -> void:
	randomize()
	CentralSignal.connect("Instantiate", Instanciar_Objeto)



func Asignar_Item():
	var file = FileAccess.open("res://DataBase/Local/Item_Equipable.json", FileAccess.READ)
	if FileAccess.file_exists("res://DataBase/Local/Item_Equipable.json"):
		loot = JSON.parse_string(file.get_as_text())
		file.close()
	return Item_Probabilidad(loot)

func Item_Probabilidad(temp_loot):
	var total_drop : float = 0.0
	var random : float = 0.0

	for i in temp_loot:
		total_drop += temp_loot[str(i)]["Drop"]
	random = randf() * total_drop
	var acumulador : float = 0.0
	for i in temp_loot :
		acumulador += temp_loot[str(i)]["Drop"]
		if random <= acumulador:
			loot = temp_loot[str(i)].duplicate(true)
			break
	return loot




func Instanciar_Objeto(temp_item , position, stats):
	temp_item.Stats = stats
	temp_item.global_position = position
	get_tree().current_scene.add_child(temp_item)
	
	get_tree().current_scene.get_node("Marcus").Give_Experiencia (randi_range(20 , 35))
