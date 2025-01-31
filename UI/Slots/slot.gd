extends Control

class_name Slot
var is_show_pupop : bool = false 

	
var is_vacio : bool = true


@export var item : Item:
	set(value):
		item = value
		if item == null :
			$Icon.texture = null
		else:
			$Icon.texture = item.texture

func VaciarSLot() -> void : 
	
	self.item = null 
	self.is_vacio = true
	
	
	
func _make_custom_tooltip(_for_text: String) -> Object:
	var tooltip = preload("res://UI/Tooltip/tooltipItem.tscn").instantiate()
	if item != null :
		tooltip.SetItem(self.item)
		return tooltip
	else : return null 
