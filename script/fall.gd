extends State

func enter():
	player.jump_input = false

func update(delta):
	if player.velocity.y == 0:
		Transitioned.emit(self,"idle")
	return null
