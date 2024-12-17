extends Node2D
class_name Fisic_Item

var item : Item
func _ready() -> void:
	randomize()
	self.texture = load("res://Assets/Mis Inventos/bolsa dropeable.png")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as MainPlayer :
		body.ui_menu_in_game.inventario.add_item(item)
		body.ui_menu_in_game.inventario.coger_objeto.play()
		queue_free()
	pass # Replace with function body.


func _on_area_2d_mouse_entered() -> void:
	self.frame = 0
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	self.frame = 1
	pass # Replace with function body.
