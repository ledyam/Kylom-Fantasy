extends Control

@onready var hour_label: Label = $Container/HBoxContainer/Hour
@onready var minute_label: Label = $Container/HBoxContainer/Minute

@onready var animation_reloj: AnimationPlayer =$Reloj_animation 


var count_week_day = 0
var hour : int = 7  
var day: int = 1
var month_count : int = 0
var minute : int = 0 
const MONTH : Array[String] = ["Emosh","Demosh","Marvosh", "Dimerbosh", "Ascurosh","Ekosh"]
const WEEK_DAY : Array[String] = ["Lunce","Martos","Mordiem", "Jumne", "Vershios","Asombe","Doringo"]

func _ready() -> void:
	animation_reloj.play("Contador")

func _process(_delta: float) -> void:

	if hour < 10 :
		hour_label.text = "0" + str(hour)
	else:
		hour_label.text =   str(hour)

	if minute < 10 :
		minute_label.text = "0" + str(minute)
	else :
		minute_label.text =  str(minute)
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
		hour = 00
		
		
	minute += 30

	pass # Replace with function body.
