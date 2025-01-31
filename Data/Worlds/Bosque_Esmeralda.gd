extends Node2D

var enemy
@onready var animation_world: AnimationPlayer = $Animation_World



func _ready() -> void:

	randomize()
	animation_world.play("Fade_In_World")
	await get_tree().create_timer(4).timeout
	Dialogic.start("Introduction1")

	
	

func _on_animation_world_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fade_In_World":
		animation_world.play("Ciclo General")
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is MainPlayer : 
		Dialogic.start("Goblin")
		$Areas2D/GoblinArea.set_deferred("monitoring", false)
	





func _on_introduction_2_body_entered(body: Node2D) -> void:
	if body is MainPlayer : 
		Dialogic.start("Introduction")
		$Areas2D/Introduction2.set_deferred("monitoring", false)
		
	pass # Replace with function body.


func _on_battle_body_entered(body: Node2D) -> void:
	if body is MainPlayer : 
		Dialogic.start("Battle")
		$Areas2D/Battle.set_deferred("monitoring", false)
		$Areas2D/Battle/Final.play()
	

	pass # Replace with function body.
