extends CharacterBody2D

func _physics_process(_delta) :
	var direction = Input.get_vector("izquierda","derecha","delante","atras")
	velocity = direction * 600
	move_and_slide()

	get_node("dev").play_walk_animation()
