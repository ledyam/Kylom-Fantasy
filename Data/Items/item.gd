extends Resource
class_name Item

@export_category("Information")
@export var ID : int
@export var name : String
@export_enum("Cabeza : 0" , "Pecho : 1", "Piernas : 2" ,  "Arma : 3" ,         \
			 " Protección : 4", "Botas : 5", "Anillo : 6" , "Collar: 7" ,"Comida" , "Bebida")       \
var type : int 


@export var texture : Texture
@export_enum("Común", "Épico","Legendario") var rarity : String
@export var drop : float
@export_multiline var description : String



@export_category("Item Attribute")
@export_enum("ATK","DEF","REG") var attribute : String
@export var attribute_value : float
