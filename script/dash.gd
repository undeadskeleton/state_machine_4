extends State

@export var animation : String 
var can_dash : bool
@export var dash_distance : float
func enter():
	player.ani2d.play(animation)
	can_dash = true

func physics_update(delta):
	if player.dash and can_dash:
		player.velocity.x = dash_distance

func update(delta):
	if player.velocity.x == 0:
		Transitioned.emit(self,"idle")

func _on_timer_timeout() -> void:
	can_dash = false
