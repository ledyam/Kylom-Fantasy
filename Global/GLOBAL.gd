extends Node

var loot : Item

func _ready() -> void:
	randomize()
	CentralSignal.connect("Instantiate", Instanciar_Objeto)



func Asignar_Item():
	var dir = DirAccess.open("res://DataBase/Local/Objects/Wapons/")
	var item : Array[Item]
	
	if dir:
		dir.list_dir_begin()
		var file = dir.get_next()
		
		while file != "":
			var item_resource = load("res://DataBase/Local/Objects/Wapons/" + file)
			item.append(item_resource)
			file = dir.get_next()
			
	return Item_Probabilidad(item)

func Item_Probabilidad(temp_loot : Array[Item]):
	var total_drop : float = 0.0
	var random : float = 0.0

	for i in temp_loot:
		total_drop += i.drop
	random = randf() * total_drop
	var acumulador : float = 0.0
	for i in temp_loot :
		acumulador += i.drop
		if random <= acumulador:
			loot = i
			break 
	return loot




func Instanciar_Objeto(temp_item , position, item):
	temp_item.item = item
	temp_item.global_position = position
	get_tree().current_scene.add_child(temp_item)
	get_tree().current_scene.get_node("Marcus").Give_Experiencia (randi_range(20 , 35))
