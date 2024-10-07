extends State

func enter():
	pass

func update(delta):
	if player.dir:
		Transitioned.emit(self,"move")
	if player.jump_input:
		Transitioned.emit(self,"jump")
	return null
	
func exit():
	print("exiting idle")
