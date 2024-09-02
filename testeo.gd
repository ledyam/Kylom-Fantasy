extends Node2D
@onready var skeleton: Undead_Enemy = $Skeleton

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		print (skeleton.EffectiveDamage(50))
	
