extends Sprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D

var Encender : bool = false 

func Encender_Luz ():
		point_light_2d.enabled = true

func Apagar_Luz ():
		point_light_2d.enabled = false
