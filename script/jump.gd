extends State

var JUMP : int = 400

func enter():
	if player.jump_input:
		player.velocity.y = -JUMP

func update(delta):
	if player.velocity.y > 0:
		Transitioned.emit(self,"fall")
	return null

func physics_update(delta):
	pass
