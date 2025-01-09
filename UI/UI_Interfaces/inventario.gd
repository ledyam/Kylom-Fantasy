extends NinePatchRect
@export_multiline var default_text : String
@onready var coger_objeto: AudioStreamPlayer = $Sounds/CogerObjeto
@onready var player_in_inv: AnimatedSprite2D =  $PlayerInInv
var player_reference : MainPlayer
@onready var stats_player: NinePatchRect = $Int_Inventario/PlayerSection/StatsPlayer


func _ready() -> void:
	player_reference = get_tree().current_scene.find_child("Marcus")
	Default_Description()
	
func _process(_delta: float) -> void:
	if self.visible:
		player_in_inv.play("Inv")

	
#Método para agregar items al inventario
func add_item (item ) :
	var index = self.find_child("GridContainer")
	
	for i in index.get_children():
		
		if !i.is_vacio and i.item == item and item.type == 8:
			i.cantidad += 1
			break

		elif i.is_vacio and item.type != 8:
			i.is_vacio = false
			i.item = item
			break
			
		elif i.is_vacio:
			i.item = item
			i.is_vacio = false
			i.cantidad += 1

			break

func set_description(item : Item):
	find_child("Name").text = item.name
	find_child("Icon").texture = item.texture
	find_child("Description").text = item.description

	
	
#Metodo por defecto para el Inventario General
func Default_Description ():
	find_child("Name").text = ""
	find_child("Icon").texture = null
	find_child("Description").text = default_text
	find_child("Stats").text = ""

#Muestra Descripción , textura y Título del Item


#region Métodos de Abastecimiento de Inventario 
func add_item_Inventory_free( item : Array ) :
	var Inventario = self.find_child("GridContainer")
	
	for slot in Inventario.get_children():
		if slot.is_vacio:
			slot.item = DatabaseReference.item_database[int(item[0])]
			slot.is_vacio = false
			slot.cantidad = int(item[1])
			break


func add_item_Inventory_Equipable(itemID , type):

	var Equipables = self.find_child("Equipable_Item")
	
	
	for slot in Equipables.get_children():
		if type == slot.slot_type:
			slot.item = DatabaseReference.item_database[int(itemID)]


#endregion
#region Sistema de Save_Load del Inventario

func GuardarInv():
	var slots_inventario = self.find_child("GridContainer")
	
	var Inventario : Dictionary = {
	 items_referencies = {},
	equipable_items_referencies = {}
	}
	
	var i = 0
	for  slot in slots_inventario.get_children():
		
		if slot.item != null:
			Inventario.items_referencies[i] = [slot.item.ID, slot.cantidad]
			i +=1 


	slots_inventario = self.find_child("Equipable_Item")
	for slot in slots_inventario.get_children():
		if slot.item != null: 
			Inventario.equipable_items_referencies[slot.item.ID]= slot.item.type

	return Inventario
	
	
func CargarInv(inventario_cargado : Dictionary):
	var Inventario = self.find_child("GridContainer")
	
	for slot in Inventario.get_children():
		slot.item = null
		slot.is_vacio = true
	
	for item in inventario_cargado.items_referencies:
		add_item_Inventory_free(inventario_cargado.items_referencies[item] )


	for item in inventario_cargado.equipable_items_referencies:
		add_item_Inventory_Equipable(item ,inventario_cargado.equipable_items_referencies[item] )
	#
	pass
#endregion
