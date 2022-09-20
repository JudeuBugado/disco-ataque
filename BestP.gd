extends Label


func _process(delta):
	self.text = "BEST: " + String(Global.RecordPontuacao) + " PONTOS"
