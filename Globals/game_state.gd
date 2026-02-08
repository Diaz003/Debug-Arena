extends Node
var return_scene_path: String = "res://Scenes/menu.tscn"
var tutorial_shown: bool = false

var current_level: int = 1
var max_level: int = 5

func on_level_completed() -> void:
	if current_level < max_level:
		current_level += 1
		var path := "res://Scenes/main/level_%d.tscn" % current_level
		await SceneTransition.fade_to_scene(path)
	else:
		var winner := preload("res://Scenes/winner/winner.tscn").instantiate()
		var scene := get_tree().current_scene
		scene.get_node("UILayer").add_child(winner)
