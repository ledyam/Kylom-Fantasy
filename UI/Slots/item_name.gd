extends Label

func _ready():

	var words = self.text  # Divide el texto en palabras
	var line = ""
	var result = ""

	for char in text:
		line += char
		if line.length() >= 14:  # Si la línea supera los 14 caracteres
			result += line + "\n"  # Añade un salto de línea
			line = ""  # Reinicia la línea
	
	if line != "" :  # Si quedan palabras sin agregar
		result += line
	
	self.text = result
