extends CharacterBody2D

@export var speed := 300.0

@onready var dev := $dev
@onready var anim: AnimatedSprite2D = $dev/AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("izquierda", "derecha", "delante", "atras")
	velocity = direction * speed
	move_and_slide()

	if velocity.length() > 0.0:
		dev.play_walk_animation()

		if velocity.x < 0.0:
			anim.flip_h = true   
		elif velocity.x > 0.0:
			anim.flip_h = false    
	else:
		dev.play_idle_animation()
