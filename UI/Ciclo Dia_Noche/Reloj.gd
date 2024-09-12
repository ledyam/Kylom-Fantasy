extends Control

@onready var month: Label = $Container/VBoxContainer/Panel/HBoxContainer/Month
@onready var day_label: Label = $Container/VBoxContainer/Panel/HBoxContainer/Day
@onready var hour_label: Label = $Container/VBoxContainer/Interface_Hour_Day/HBoxContainer/Hour
@onready var minute_label: Label = $Container/VBoxContainer/Interface_Hour_Day/HBoxContainer/Minute
@onready var current_ubication: Label = $Container/VBoxContainer/Current_Ubication/Current_Ubication
@onready var week_day: Label = $Container/VBoxContainer/Interface_Hour_Day/Week_day
@onready var animation_reloj: AnimationPlayer =$Reloj_animation 


var count_week_day = 0
var hour : int = 7  
var day: int = 1
var day_count : int = 0
var minute : int = 0 
const MONTH : Array[String] = ["Emosh","Demosh","Marvosh", "Dimerbosh", "Ascurosh","Ekosh"]
const WEEK_DAY : Array[String] = ["Lunce","Martos","Mordiem", "Jumne", "Vershios","Asombe","Doringo"]

func _ready() -> void:
	animation_reloj.play("Contador")

func _process(_delta: float) -> void:
	
	#Toma la Zona donde se encuentra el Player
	current_ubication.text = CurrentZone.GetZone()
	#Asignación del Tiempo y Fecha en Interfaz 
	month.text = MONTH[day_count]
	week_day.text = WEEK_DAY[count_week_day]
	if hour < 10 :
		hour_label.text = "0" + str(hour)
	else:
		hour_label.text =   str(hour)

	if minute < 10 :
		minute_label.text = "0" + str(minute)
	else :
		minute_label.text =  str(minute)

	day_label.text = str(day) + "th";
	pass
	
	if $Timer.is_stopped():
		$Timer.start()
	

func _on_timer_timeout() -> void:
	#Time Ingame
	if minute == 30  :
		hour += 1
		minute = 0
		return
		
	if hour == 24 : 
		day += 1
		count_week_day += 1
		
		if count_week_day > 6 :
			count_week_day = 0
			
		hour = 00
		
		
	if day == 30:
		day_count += 1
		
		
	minute += 30

	pass # Replace with function body.
