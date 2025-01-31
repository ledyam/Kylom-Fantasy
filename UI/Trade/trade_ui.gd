extends CanvasLayer

var inventario_reference

func _ready() -> void:
	$PrincipalFrame/AnimationMarketFrame.play("Show_Shop")
	PlayerMoney.connect("RestarDinero", RestarInventario_SumarTienda)
	PlayerMoney.connect("SumarDinero", RestarTienda_SumarInventario)
	%TraderMoneyValue.text = str(get_parent().money)
	inventario_reference = get_tree().current_scene.find_child("Marcus").general_menu.inventario
	%PlayerMoneyValue.text = str(PlayerMoney.real_money)
	ObtenerSlotsDeInventario()



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
	get_parent().money += importe
	PlayerMoney.real_money -= importe
	%PlayerMoneyValue.text = str(PlayerMoney.real_money)
	%TraderMoneyValue.text = str(get_parent().money)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		inventario_reference.ActualizarDespuesDeMercadeo(%GridContainer.get_children())
		PlayerMoney.emit_signal("ActualizarDinero")
		self.queue_free()
		


func _on_comprar_pressed() -> void:
	if %Productos.is_anything_selected():
		var item_seleccionado = %Productos.ComprarItems()
		if PlayerMoney.real_money >= item_seleccionado.precio: 
				PlayerMoney.RestarDinero.emit(item_seleccionado.precio)
				%Inventory_Frame.add_item(item_seleccionado)



func ObtenerSlotsDeInventario() -> void : 
	var inventory_items = inventario_reference.SlotDeReferenciaRellenados()
	var j = 0 
	var node = %GridContainer.get_children()
	for slot  in inventory_items :
		if  node[j].is_vacio:
			node[j].item = slot.item
			node[j].is_vacio = false
			node[j].cantidad = slot.cantidad
			j+=1
