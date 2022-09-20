extends Label


func _process(delta):
	self.text = "LAST: " + String(Global.pontuacao) + " PONTOS"
