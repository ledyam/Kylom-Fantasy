extends Control
@onready var month: Label = $Ciclo_UI/Container/VBoxContainer/Panel/HBoxContainer/Mouth
@onready var day_label: Label = $Ciclo_UI/Container/VBoxContainer/Panel/HBoxContainer/Day
@onready var hour_label: Label = $Ciclo_UI/Container/VBoxContainer/Interface_Hour_Day/HBoxContainer/Hour
@onready var minute_label: Label = $Ciclo_UI/Container/VBoxContainer/Interface_Hour_Day/HBoxContainer/Minute
@onready var timer: Timer = $Timer


var hour : int = 7  
var day: int = 1
var day_cont : int = 0
var minute : int = 0 
const MONTH : Array[String] = ["Emosh","Demosh","Marvosh", "Dimerbosh", "Ascurosh","Ekosh"]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	month.text = MONTH[day_cont]
	minute_label.text = str(minute)
	hour_label.text = str(hour)
	day_label.text = str(day);
	pass


func CicloTime():
	if minute == 30  :
		hour += 1
		minute = 0
		return
		
	if hour == 24 : 
		day +=1
		hour = 00
	if day == 30:
		day_cont +=1
		
	minute += 30
	pass # Replace with function body.
