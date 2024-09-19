extends Control

@onready var animation_menu: AnimationPlayer = $AnimationMenu
@onready var gui_transition: Node = $Panel/GuiTransition




func _ready() -> void:
	$"BasicRpgIntroTrack(rpg)".play()
	animation_menu.play("Introduction")
	

	


func _on_animation_menu_animation_finished(_anim_name: StringName) -> void:
	if _anim_name == "Oclution":
		get_tree().change_scene_to_file("res://Data/World/world.tscn")
	if _anim_name == "Introduction":
		gui_transition._show()


func _on_button_with_sound_pressed() -> void:
	if gui_transition._is_shown : 
		gui_transition._hide()
		animation_menu.play("Oclution")
	pass # Replace with function body.
