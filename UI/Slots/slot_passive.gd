extends Control

class_name SlotPasive

@export_enum("Cabeza : 0" , "Pecho : 1", "Piernas : 2" ,  "Arma : 3" ,         \
			 " Protección : 4", "Botas : 5", "Anillo : 6" , "Collar: 7")       \

var slot_type : int 
var is_show_pupop : bool = false 

var item : Item:
	set(value):
		item = value
		if item == null :
			$Icon.texture = load("res://Assets/GUI/GUI/"+str(slot_type)+".png")
		else:
			$Equip.play()
			$Icon.texture = item.texture


	

	
func _ready() -> void:
	$Icon.texture =  load("res://Assets/GUI/GUI/"+str(slot_type)+".png")
	
func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click derecho"):
		DesequiparItem()


func Desasignar_Stats():
	
	match item.type : 
		3: owner.player_reference.stats.ATK -= item.attribute_value


func DesequiparItem(): 
	if self.item != null:
		$Icon.texture = load("res://Assets/GUI/GUI/"+str(slot_type)+".png")
		owner.Default_Description()
		Desasignar_Stats()
		$Unquip.play()
		owner.add_item(item)
		self.item = null



func _get_drag_data(_at_position: Vector2) -> Variant:
	
	var preview_texture = TextureRect.new()
	var control = Control.new()
	var item_temp : Item
	
	item_temp = self.item
	preview_texture.texture = self.item.texture
	control.add_child(preview_texture)
	control.z_index = 1
	
	set_drag_preview(control)
	VaciarSLot()
	$Unquip.play()
	return item_temp

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Array
	
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	
	if data[0].type == self.slot_type : 
		self.item = data[0]



func _make_custom_tooltip(_for_text: String) -> Object:
		if item != null :
			var tooltip = preload("res://UI/Tooltip/tooltipItem.tscn").instantiate()
			tooltip.SetItem(self.item)
			return tooltip
		else : return null


func VaciarSLot() -> void : 
	self.item = null 
