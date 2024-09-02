extends Node2D


@export var group_name : String = "FirstEnemy"


var positions : Array = [] 
var temp_positions : Array 
var current_positions :Marker2D
var direction : Vector2 = Vector2.ZERO

func _ready() -> void:
	
	positions = get_tree().get_nodes_in_group(group_name)
	print(positions)
	get_positions()
	_get_next_positions()
	
func _physics_process(_delta: float) -> void:
	if global_position.distance_to(current_positions.position) <10:
		_get_next_positions()
	pass
	
	
func get_positions():
	temp_positions = positions.duplicate()
	temp_positions.shuffle()
	
func _get_next_positions():
	if temp_positions.is_empty():
		get_positions()
	current_positions = temp_positions.pop_front()
	direction = to_local(current_positions.position).normalized()
