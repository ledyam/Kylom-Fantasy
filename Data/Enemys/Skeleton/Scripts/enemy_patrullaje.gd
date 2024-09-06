extends EnemyState

@onready var receso_patrullaje: Timer = $Receso_Patrullaje

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	print (enemy.name  + " : Entrando en modo Patrulla")
	

func physics_process(_delta: float) -> void:
	
	if !enemy.on_area :
		enemy.velocity = enemy.Patrullaje.direction * 15
		if enemy.position < enemy.Patrullaje.current_positions.position :
			enemy.anim_enemy.play("Skeleton_walk")
			enemy.anim_enemy.flip_h = false 
		else: 
			enemy.anim_enemy.play("Skeleton_walk")
			enemy.anim_enemy.flip_h = true   
			
		enemy.move_and_slide()
		if receso_patrullaje.is_stopped():
			receso_patrullaje.start()
	else:
		
		state_machine.change_to("EnemyWalk")


func _on_receso_patrullaje_timeout() -> void:
	state_machine.change_to("EnemyIdle")
	pass # Replace with function body.
