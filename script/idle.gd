extends State

@export var animation_name : String

func enter():
	player.ani2d.play(animation_name)

func update(delta):
	if player.dir:
		Transitioned.emit(self,"move")
	if player.jump_input:
		Transitioned.emit(self,"jump")
	if player.dash:
		Transitioned.emit(self,"dash")
	return null
	
func exit():
	pass
