extends State

var Speed : int = 300

func enter():
	print("entered move")

func update(delta):
	if player.velocity.x == 0:
		Transitioned.emit(self,"idle")
	if player.jump_input:
		Transitioned.emit(self,"jump")
	return null
	
func physics_update(delta):
	if player.dir:
		print(player.dir,"in move")
		player.velocity.x = player.dir * Speed
	else:
		player.velocity.x = move_toward(player.velocity.x,0,Speed)
	player.move_and_slide()
