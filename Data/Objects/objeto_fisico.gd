extends Objeto
class_name ObjetoFisico

func _ready() -> void:
	randomize()
	self.texture = load(Stats["Texture"])
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as MainPlayer :
		body.ui_menu_in_game.inventario.add_item(Stats)
		body.ui_menu_in_game.inventario.coger_objeto.play()
		queue_free()
	pass # Replace with function body.
