extends Label


func _process(_delta):
	self.text = "BEST: " + String(Global.RecordPontuacao) + " PONTOS"
