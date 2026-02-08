extends CharacterBody2D

signal health_changed(current_health: int, max_health: int)
signal died

@export var speed: float = 300.0
@export var max_health: int = 100
var health: int = 100

@onready var dev := $dev
@onready var anim: AnimatedSprite2D = $dev/AnimatedSprite2D
@onready var gun_anchor: Node2D = $GunAnchor

func _ready() -> void:
	# Al empezar, avisamos al HUD del estado inicial
	health = max_health
	health_changed.emit(health, max_health)

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

func take_damage(amount: int) -> void:
	if health <= 0:
		return

	health -= amount
	if health < 0:
		health = 0

	health_changed.emit(health, max_health)

	if health == 0:
		died.emit()
