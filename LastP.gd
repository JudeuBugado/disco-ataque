extends Label


func _process(_delta):
	self.text = "LAST: " + String(Global.pontuacao) + " PONTOS"
