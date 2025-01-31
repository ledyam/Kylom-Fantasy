extends Control

var goblin_contador : int = 0
var slime_contador : int = 0
@onready var slime_value: Label = %SlimeValue

func _ready() -> void:
	Dialogic.connect("signal_event", ActivarMision)
	CentralSignal.mision.connect(on_mision)
	
	
	
	
func on_mision(mob_type ):
	
	if mob_type == "Goblin" and goblin_contador != 5:
		goblin_contador+= 1 
		%goblinValue.text = str(goblin_contador) + "/5"
		
	if mob_type == "Slime" and slime_contador != 5:
		slime_contador += 1 
		slime_value.text = str(slime_contador) + "/5"
		
	if goblin_contador == 5 and slime_contador == 5:
		$Panel/VBoxContainer/HBoxContainer/Label3.hide()
		%goblinValue.hide()
		$Panel/VBoxContainer/HBoxContainer2/Label3.hide()
		%SlimeValue.hide()
		$Label.show()
		CentralSignal.Quitable.emit()
		await get_tree().create_timer(2).timeout
		queue_free()
		
		
func ActivarMision(argument : String ): 
	if argument == "ActivarMision":
		self.show()
