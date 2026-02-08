extends Node2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func play_idle_animation() -> void:
	anim.play("idle")

func play_walk_animation() -> void:
	anim.play("walk")
