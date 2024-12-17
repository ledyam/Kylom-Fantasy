extends Resource
class_name Item

@export_category("Information")
@export var name : String
@export var slot_type : int
@export var texture : Texture
@export_enum("Common", "Epic","Legendary") var rarity : String
@export var drop : float
@export_multiline var description : String
@export_enum("Wapon","Armor","Use") var type : String


@export_category("Item Attribute")
@export_enum("ATK","DEF","POTION") var attribute : String
@export var attribute_value : float
