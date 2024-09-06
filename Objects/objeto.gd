extends RigidBody2D
class_name ObjetoFisico
@onready var sprite_2d: Sprite2D = $Sprite2D

var Stats : Dictionary = {}


func _ready() -> void:
	randomize()
	DataBase.connect(DataBase.BDReady.get_name(), BD_Ready)
	
	
func BD_Ready():
	DataBase.database.execute('SELECT *
	FROM public."Item_Consumible";')
	await get_tree().create_timer(0.1).timeout
	Stats = DataBase.Items_data[randi_range(0,1)]
	sprite_2d.texture = load(Stats["texture"])
	
