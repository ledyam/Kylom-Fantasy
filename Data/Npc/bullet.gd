extends Node2D

const SPEED := 80
var direccion
var is_moving: bool = true
var damage = 5
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	# Calcula la dirección hacia el jugador
	direccion = (get_tree().current_scene.find_child("Marcus").global_position - position).normalized()
	$AnimatedSprite2D.play("default")

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	# Elimina el nodo si sale de la pantalla
	queue_free()

func _process(delta: float) -> void:
	# Mueve la bola si está en movimiento
	if is_moving:
		position += direccion * SPEED * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is MainPlayer: 
		# Cambia a la animación de explosión
		$AnimatedSprite2D.play("explotion")
		$"04FireExplosion04Medium".play()
		body.Recibir_damage(5)
		# Detiene el movimiento
		is_moving = false

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "explotion":
		# Elimina el nodo después de la animación
		queue_free()

func CambiarAnim():
	$AnimatedSprite2D.play("2default")
