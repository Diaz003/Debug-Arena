extends Node2D

@onready var anim: AnimationPlayer = $AnimationPlayer
var BulletScene := preload("res://Wearpons/Guns_keyboard/Bullet.tscn")  

var muzzle_offset := Vector2(40, 0) 

func _process(delta: float) -> void:
	rotation = (get_global_mouse_position() - global_position).angle()

	if Input.is_action_just_pressed("shoot"):
		play_shoot()
		shoot_bullet()

func play_shoot() -> void:
	anim.stop()
	anim.play("shoot")

func shoot_bullet() -> void:
	var bullet := BulletScene.instantiate()
	bullet.global_position = global_position + muzzle_offset.rotated(rotation)
	bullet.direction = (get_global_mouse_position() - bullet.global_position).normalized()
	get_tree().current_scene.add_child(bullet)

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "shoot":
		anim.play("idle")
