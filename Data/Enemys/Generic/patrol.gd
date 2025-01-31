extends Node2D

@export var group_name : String = "FirstEnemy"
@export var group_name1 : String = "SecondEnemy"

var positions : Array = []
var temp_positions : Array = []
var current_position : Marker2D
var direction : Vector2 = Vector2.ZERO
@export var speed : float = 100.0  # Velocidad de movimiento del enemigo

func _ready() -> void:
	# Determina las posiciones según el grupo del enemigo
	if get_parent().NOMBRE == "Slime":  # Usa `.name` en lugar de `NOMBRE`
		positions = get_tree().get_nodes_in_group(group_name1)
	else:
		positions = get_tree().get_nodes_in_group(group_name)

	if positions.size() == 0:
		print("No positions found in group: ", group_name)
		return

	get_positions()
	_get_next_position()

func _physics_process(_delta: float) -> void:
	if current_position:
		# Mueve al enemigo hacia la posición actual
		var movement = direction * speed * _delta
		global_position += movement

		# Verifica si alcanzó la posición actual
		if global_position.distance_to(current_position.global_position) < 10.0:
			_get_next_position()

func get_positions():
	# Crea una lista temporal de posiciones y la mezcla
	temp_positions = positions.duplicate()
	temp_positions.shuffle()

func _get_next_position():
	# Si no hay posiciones temporales, vuelve a generarlas
	if temp_positions.is_empty():
		get_positions()

	# Obtiene la siguiente posición y calcula la dirección
	current_position = temp_positions.pop_front()
	direction = (current_position.global_position - global_position).normalized()
