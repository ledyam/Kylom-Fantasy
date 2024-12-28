extends Node2D

@onready var marcus: MainPlayer = $Marcus

@export var item : Item 


func _ready() -> void:
	
	print(item.type)
