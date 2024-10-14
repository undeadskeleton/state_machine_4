extends State

@export var animation_name : String

func enter():
	player.ani2d.play(animation_name)
	player.jump_input = false

func update(delta):
	if player.velocity.y == 0:
		Transitioned.emit(self,"idle")
	return null

func physics_update(delta):
	if player.dir:
		player.velocity.x = player.dir * player.Speed
	else:
		player.velocity.x = move_toward(player.velocity.x,0,player.Speed)
		
	if player.velocity.x < 0:
		player.ani2d.flip_h = true
	elif player.velocity.x > 0:
		player.ani2d.flip_h = false
	player.move_and_slide()

func exit():
	player.velocity.x = 0
	
