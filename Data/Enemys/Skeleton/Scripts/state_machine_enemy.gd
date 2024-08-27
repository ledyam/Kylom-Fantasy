extends StateMachine


func _enter_state():
	if DEBUG:
		print (controlador.name, ": Entrando en estado :", state.name)
	state.enemy = controlador
	state.state_machine = self
	state.enter()
	initialized = true 
