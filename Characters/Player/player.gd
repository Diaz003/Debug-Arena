extends CharacterBody2D

@export var speed := 300

func _physics_process(_delta) :
	var direction = Input.get_vector("izquierda","derecha","delante","atras")
	velocity = direction * speed
	move_and_slide()

	get_node("dev").play_idle_animation()
