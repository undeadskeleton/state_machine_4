extends Node

class_name State

@export var animation_name : String

signal Transitioned
@export var player : CharacterBody2D
func enter():
	player.ani2d.play(animation_name)

func update(delta):
	pass
	
func physics_update(delta):
	pass

func exit():
	pass
