extends Node
##Movimiento Rectilineo Uniforme 
##Version 1.0

class_name MRU2D
@export var ver_vector : bool = false  
@export var character : CharacterBody2D
@export var speed: float = 50
@export var direction_2d : Vector2 
@export var normalized : bool = true 





func _ready() -> void:
	pass
	
	
func get_velocity() -> Vector2: 
	if normalized :
		direction_2d = direction_2d.normalized()
	
	if ver_vector:
		print (direction_2d)
	return direction_2d * speed
	
func move():
	character.velocity = get_velocity()

	pass
