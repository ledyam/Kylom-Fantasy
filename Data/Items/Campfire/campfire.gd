extends Node2D

var on_area = false
var  encendido = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is MainPlayer : 
		on_area = true
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "starting":
		$AnimatedSprite2D.play("burning")



func _process( _delta: float) -> void:
	if on_area and Input.is_action_just_pressed("Atacar"):
		if encendido :
			$AnimatedSprite2D.play("ending")
			encendido = false
		else : 
			$AnimatedSprite2D.play("starting")
			encendido = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	on_area = false 
	pass # Replace with function body.
