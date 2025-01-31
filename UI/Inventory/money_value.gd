extends Label

func _ready() -> void:
	self.text = str(PlayerMoney.real_money)
	PlayerMoney.connect("ActualizarDinero", on_ActualizarDinero)
	
	
	
	
func on_ActualizarDinero():
	self.text = str(PlayerMoney.real_money)
