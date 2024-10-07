extends CharacterBody2D

#movement
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jump_input: bool
var dir : int
var dash : bool
#references
@onready var ani2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	player_input(delta)
	move_and_slide()
	#handle_animation()


func player_input(delta):
	if not is_on_floor():
		velocity += delta * get_gravity()
		
	dir = Input.get_axis("left","right")
	"""
	if dir:
		velocity.x = dir * SPEED
	else:
		velocity.x = move_toward(velocity.x,0,SPEED)
	"""
	if Input.is_action_just_pressed("jump"):
		jump_input = true
		#velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("dash"):
		dash = true
	else:
		dash = false

func handle_animation():
	if velocity.x == 0:
		ani2d.play("idle")
	if velocity.x !=0:
		if velocity.x > 0:
			ani2d.flip_h = false
		if velocity.x < 0:
			ani2d.flip_h = true
		ani2d.play("move")
	if jump_input:
		ani2d.play("jump")
		#await get_tree().create_timer(0.5).timeout
		#jump_input = false
	elif velocity.y > 0:
		ani2d.play("fall")
