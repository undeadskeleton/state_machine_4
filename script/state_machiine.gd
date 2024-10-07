extends Node

var state : Dictionary = {}

var current_state : State
@export var player : CharacterBody2D
@export var initial_state : State

func _ready() -> void:
	for child in get_children():
		if child is State:
			state[child.name.to_lower()] = child
			child.Transitioned.connect(change_state)
			print("connecting state")
	current_state = initial_state

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
	$"../Label".text = str(current_state.get_name())
	
func change_state(state,new_state_name):
	if state != current_state:
		print("state != current_state")
		return
		
	var new_state = state.get(new_state_name.to_lower())
	print(new_state)
	if !new_state:
		print("!new state")
		return
		
	if current_state:
		print("exiting current_state")
		current_state.exit()
	print("entering new_state")
	new_state.enter()
	
	current_state = new_state
