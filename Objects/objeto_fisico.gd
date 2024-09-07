extends Objeto
class_name ObjetoFisico
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $Marker2D/AnimationPlayer



func _ready() -> void:
	randomize()
	sprite_2d.texture = load(Stats["texture"])
	animation_player.play("Caida_Drop")
	
	


	
	
