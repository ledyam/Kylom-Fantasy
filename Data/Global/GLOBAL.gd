extends Node

var NodesMarker2D : Array 
# Called when the node enters the scene tree for the first time.

func ObtenerNodos(aux):
	NodesMarker2D.append(aux)
	
	
func GetNodes():
	return NodesMarker2D
	
