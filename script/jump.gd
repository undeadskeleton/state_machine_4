extends State

var JUMP : int = 500
@export var animation_name : String

func enter():
	player.ani2d.play(animation_name)
	if player.jump_input:
		player.velocity.y = -JUMP

func update(delta):
	if player.velocity.y > 0:
		Transitioned.emit(self,"fall")
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
