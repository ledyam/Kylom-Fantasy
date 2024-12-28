extends Node2D
var n = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("idle")
	
	pass # Replace with function body.

func SiguienteTextura():
	
	var texturas : Array[Texture] = [preload("res://Assets/Mis Inventos/Plantilla SV.png"),preload("res://Assets/Mis Inventos/botaotra.png")]
	n = (n+1) % texturas.size()
	$Sprite2D2.texture =  texturas[n]
