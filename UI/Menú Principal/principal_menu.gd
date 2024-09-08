extends Control

@onready var animation_menu: AnimationPlayer = $AnimationMenu


func _on_inicio_pressed() -> void:
	animation_menu.play("Oclution")
	
	pass # Replace with function body.


func _on_animation_menu_animation_finished(anim_name: StringName) -> void:
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Data/World/world.tscn")
	pass # Replace with function body.
