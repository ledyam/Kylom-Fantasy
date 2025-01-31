extends Control

@onready var animation_menu: AnimationPlayer = $AnimationMenu
@onready var gui_transition: Node = $Panel/GuiTransition
@onready var control: Control = $CanvasLayer/Control




func _ready() -> void:
	$"BasicRpgIntroTrack(rpg)".play()
	animation_menu.play("Introduction")
	

	


func _on_animation_menu_animation_finished(_anim_name: StringName) -> void:
	if _anim_name == "Oclution":
		get_tree().change_scene_to_file("res://Data/Worlds/Bosque_Burbuja.tscn")
	if _anim_name == "Introduction":
		gui_transition._show()


func _on_button_with_sound_pressed() -> void:
	if gui_transition._is_shown : 
		gui_transition._hide()
		animation_menu.play("Oclution")
	pass # Replace with function body.


func _on_controles_pressed() -> void:

	control.animation_player.play("Mostrar")
	pass # Replace with function body.


func _on_salir_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
