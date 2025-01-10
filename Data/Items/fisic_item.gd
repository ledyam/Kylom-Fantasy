extends Node2D
class_name Fisic_Item

var item : Item
func _ready() -> void:
	randomize()
	self.texture = item.texture
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as MainPlayer :
		body.general_menu.inventario.add_item(item)
		body.general_menu.inventario.coger_objeto.play()
		queue_free()
	pass # Replace with function body.
