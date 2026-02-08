extends Node2D

@export var bug_scene: PackedScene

@onready var player := get_tree().get_first_node_in_group("player")

func spawn_bugs_for_level(level: int) -> void:
	if not bug_scene or not player:
		return

	var count := 3 if level == 1 else 5

	for i in range(count):
		var bug := bug_scene.instantiate()
		var offset := Vector2(randf_range(-400, 400), randf_range(-300, 300))
		bug.global_position = player.global_position + offset
		add_child(bug)
