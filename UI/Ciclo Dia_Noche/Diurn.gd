extends Control
@onready var month: Label = $Ciclo_UI/Container/VBoxContainer/Panel/HBoxContainer/Mouth
@onready var day_label: Label = $Ciclo_UI/Container/VBoxContainer/Panel/HBoxContainer/Day
@onready var hour_label: Label = $Ciclo_UI/Container/VBoxContainer/Interface_Hour_Day/HBoxContainer/Hour
@onready var minute_label: Label = $Ciclo_UI/Container/VBoxContainer/Interface_Hour_Day/HBoxContainer/Minute
@onready var current_ubication: Label = $Ciclo_UI/Container/VBoxContainer/Current_Ubication/Current_Ubication
@onready var week_day: Label = $Ciclo_UI/Container/VBoxContainer/Interface_Hour_Day/Week_day
@onready var animation_player: AnimationPlayer = $AnimationPlayer




var wd = 0
var hour : int = 7  
var day: int = 1
var day_cont : int = 0
var minute : int = 0 
const MONTH : Array[String] = ["Emosh","Demosh","Marvosh", "Dimerbosh", "Ascurosh","Ekosh"]
const WEEK_DAY : Array[String] = ["Lunce","Martos","Mordiem", "Jumne", "Vershios","Asombe","Doringo"]

func _ready() -> void:
	animation_player.play("Contador")

func _process(delta: float) -> void:
	
	current_ubication.text = CurrentZone.GetZone()
	month.text = MONTH[day_cont]
	week_day.text = WEEK_DAY[wd]
	if hour < 10 :
		hour_label.text = "0" + str(hour)
	else:
		hour_label.text =   str(hour)
	if minute < 10 :
		minute_label.text = "0" + str(minute)
	else :
		minute_label.text =  str(minute)

	day_label.text = str(day);
	pass


func CicloTime():
	if minute == 30  :
		hour += 1
		minute = 0
		return
		
	if hour == 24 : 
		day +=1
		wd+=1
		if wd > 6 :
			wd = 0
		hour = 00
	if day == 30:
		day_cont +=1
		
		
	
		
	minute += 30
	pass # Replace with function body.
