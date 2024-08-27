extends Node
class_name PlayerState

var state_machine : StateMachine
var player : MainPlayer

func enter ():
	pass 
	
	
func set_current_direction( direction : PlayerDirection ):
		player.current_direction = direction 
		
