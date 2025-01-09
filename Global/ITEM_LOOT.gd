extends Node

enum ItemCategory { WEAPON, CONSUMABLE, ARMOR }

var category_paths = {
	ItemCategory.WEAPON: "res://DataBase/Local/Objects/Weapons/",
	ItemCategory.CONSUMABLE: "res://DataBase/Local/Objects/Consumable/",
	ItemCategory.ARMOR: "res://DataBase/Local/Objects/Armors/"
}


var drop_table = {
	ItemCategory.WEAPON: 0.33,       
	ItemCategory.CONSUMABLE: 0.32,  
	ItemCategory.ARMOR: 0.31        
}


var specific_rarity_probabilities = {
	"Común": 0.8,  
	"Poco Común": 0.5 ,
	"Épico": 0.4,  
	"Legendario": 0.3 
}

var loot : Item

func _ready() -> void:
	randomize()
	CentralSignal.connect("Instantiate", Instanciar_Objeto)

#region Generedores
func get_random_category():
	
	var rand = randf()
	var cumulative = 0.0
	for category in drop_table.keys():
		cumulative += drop_table[category]
		if rand <= cumulative:
			return category
	return null
	
func get_random_rarity():
	var rand = randf()
	var cumulative = 0.0
	for category in specific_rarity_probabilities.keys():
		cumulative += specific_rarity_probabilities[category]
		if rand <= cumulative:
			return category
	return null

#endregion



func Asignar_Item():

	var dir = DirAccess.open(category_paths[get_random_category()])
	var item : Array[Item]
	
	if dir:
		dir.list_dir_begin()
		var file = dir.get_next()
		
		while file != "":
			var item_resource = load(dir.get_current_dir() + "/" + file)
			item.append(item_resource)
			file = dir.get_next()
			
	return Item_Probabilidad(item)
	


func Item_Probabilidad(temp_loot : Array[Item]):
		
		var rarity_categoria = get_random_rarity()
		
		var total_drop : float = 0.0
		var random : float = 0.0

		for i in temp_loot:
			if i.rarity == rarity_categoria:
				total_drop += i.drop
		random = randf() * total_drop
		var acumulador : float = 0.0
		for i in temp_loot :
			if i.rarity == rarity_categoria : 
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
