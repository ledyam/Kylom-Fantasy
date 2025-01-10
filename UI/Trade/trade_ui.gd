extends CanvasLayer

var inventario_reference

func _ready() -> void:
	PlayerMoney.connect("RestarDinero", RestarInventario_SumarTienda)
	PlayerMoney.connect("SumarDinero", RestarTienda_SumarInventario)
	print(get_parent().name)
	%TraderMoneyValue.text = str(get_parent().money)
	inventario_reference = get_tree().current_scene.find_child("Marcus").general_menu.inventario
	%PlayerMoneyValue.text = str(PlayerMoney.real_money)
	var inventory_items = inventario_reference.SlotRellenados()
	var j = 0 
	var node = %GridContainer.get_children()
	for slot  in inventory_items :
		if  node[j].is_vacio:
			node[j].item = slot.item
			node[j].is_vacio = false
			node[j].cantidad = slot.cantidad
			j+=1
			
			
		
func RestarTienda_SumarInventario(importe):
	if self.visible and importe > get_parent().money :
		
		PlayerMoney.real_money += get_parent().money
		get_parent().money = 0 
		
	
		
		%PlayerMoneyValue.text = str(PlayerMoney.real_money)
		%TraderMoneyValue.text = str(get_parent().money)
		
	elif self.visible and get_parent().money > 0 :
		
		get_parent().money -= importe
		PlayerMoney.real_money += importe
		
		%PlayerMoneyValue.text = str(PlayerMoney.real_money)
		%TraderMoneyValue.text = str(get_parent().money)
	
func RestarInventario_SumarTienda(importe):

	if self.visible and importe > PlayerMoney.real_money :
		
		OS.alert("DineroInsufuciente")
		
		%TraderMoneyValue.text = str(get_parent().money)
		%PlayerMoneyValue.text = str(PlayerMoney.real_money)
		
	elif self.visible and PlayerMoney.real_money > 0 :
		
		get_parent().money += importe
		PlayerMoney.real_money -= importe
		
		%PlayerMoneyValue.text = str(PlayerMoney.real_money)
		%TraderMoneyValue.text = str(get_parent().money)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		self.queue_free()


func _on_vender_pressed() -> void:
	PlayerMoney.SumarDinero.emit(100)
	pass # Replace with function body.


func _on_comprar_pressed() -> void:
	PlayerMoney.RestarDinero.emit(100)
	pass # Replace with function body.
