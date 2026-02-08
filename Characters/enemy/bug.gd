extends CharacterBody2D

@export var speed: float = 80.0
@export var max_health: int = 3
@onready var health_bar: ProgressBar = $HealthBar
var health: int = 0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")

func _ready() -> void:
	health = max_health
	if anim:
		anim.play("walk")
	if health_bar:
		health_bar.max_value = max_health
		health_bar.value = health

func _physics_process(delta: float) -> void:
	if not player:
		return

	var dir := global_position.direction_to(player.global_position)
	velocity = dir * speed
	move_and_slide()

	if anim:
		if dir.x < 0.0:
			anim.flip_h = true
		elif dir.x > 0.0:
			anim.flip_h = false

func take_damage(amount: int) -> void:
	health -= amount
	if health_bar:
		health_bar.value = health
	if health <= 0:
		queue_free()

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.has_method("take_damage"):
		body.take_damage(15)
