extends Area2D

@export var speed: float = 600.0
@export var max_distance: float = 800.0
@export var from_player: bool = true   # true = bala del jugador, false = bala de enemigo

var direction: Vector2 = Vector2.ZERO
var start_position: Vector2

func _ready() -> void:
	start_position = global_position

func _process(delta: float) -> void:
	if direction != Vector2.ZERO:
		global_position += direction * speed * delta

	if global_position.distance_to(start_position) > max_distance:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if not body.has_method("take_damage"):
		return

	# Si la bala es del jugador, solo daña enemigos
	if from_player and body.is_in_group("enemy"):
		body.take_damage(1)
		queue_free()
		return

	# Si la bala es de enemigo, solo daña al jugador
	if not from_player and body.is_in_group("player"):
		body.take_damage(1)
		queue_free()
