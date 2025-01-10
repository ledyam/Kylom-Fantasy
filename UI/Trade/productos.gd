extends ItemList



	

		


func _on_button_pressed() -> void:
	for i in range (5):
		add_item("Huevo",load("res://Assets/Tiles/16x16 Item Pack/Item__01.png"))
		set_item_tooltip_enabled(i,false)
	pass # Replace with function body.
