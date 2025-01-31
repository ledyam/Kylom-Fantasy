extends Marker2D

var ENEMYS: Dictionary = {
	0: "res://Data/Enemys/Goblin/goblin 2.0.tscn",
	1: "res://Data/Enemys/Slime/slime 2.0.tscn"
}
@export_enum("Goblin","Slime") var mob : int

var contador: int = 0
var max_instan: int = 10  # Máximo de instancias permitidas
@export var interval: float = 3.0  # Intervalo en segundos

func _ready() -> void:
	# Inicia un temporizador para instanciar enemigos
	var timer = Timer.new()
	timer.wait_time = interval
	timer.one_shot = false
	timer.connect("timeout", _on_timer_timeout)
	add_child(timer)
	timer.start()

func _on_timer_timeout() -> void:
	if contador >= max_instan:
		$Timer.stop()  # Detener el temporizador cuando alcanza el límite
		return

	# Selecciona un enemigo aleatorio del diccionario
  
	var enemy_scene = load(ENEMYS[mob])
	var enemy = enemy_scene.instantiate()
	# Posiciona el enemigo en la posición del marcador
	enemy.global_position = global_position
	# Añade el enemigo a la escena
	get_parent().add_child(enemy)
	if contador == 1 : 
		enemy.scale = Vector2(2,2)
		enemy.modulate = "ff1a1a"
		enemy.ATK = 50
		enemy.DEF = 60
		enemy.critic_chance = 0.1
	# Incrementa el contador
	contador += 1
