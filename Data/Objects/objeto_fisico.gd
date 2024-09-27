extends Objeto

class_name ObjetoFisico


@onready var animation_player: AnimationPlayer = $Marker2D/Object_Animation



func _ready() -> void:
	randomize()
	self.texture = load(Stats["Texture"])
	animation_player.play("Caida_Drop")
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as MainPlayer :
		body.ui_menu_in_game.inventario.add_item(Stats)
		queue_free()
	pass # Replace with function body.
