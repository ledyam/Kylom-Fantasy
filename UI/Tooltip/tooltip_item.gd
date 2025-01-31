extends MarginContainer


func SetItem(item : Item):
	%Name.text = item.name
	%Attribute.text = item.attribute
	%AttributeValue.text = str(item.attribute_value)
	%Rarity.text = set_text_efect(item.rarity)
	%LevelValue.text = str(2)
	
func set_text_efect(rarity : String) : 
	var text : String = rarity 
	match rarity :
		"Común" : 
			text  = "[pulse freq = 5.0 color #ffffff40 ease = -2][color=gray]" + rarity + "[/color][/pulse]"
	
	return text 
