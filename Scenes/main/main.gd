extends Node2D

var alive_bugs := 0
var game_ended := false
var tree_ref: SceneTree

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")

func _ready() -> void:
	tree_ref = get_tree()
	tree_ref.paused = false
	game_ended = false

	if has_node("WinnerOverlay"):
		$WinnerOverlay.visible = false
	if has_node("UILayer/PauseMenu"):
		$UILayer/PauseMenu.visible = false

	MusicPlayer.play_game_music()
	spawn_bugs()
	await tree_ref.create_timer(0.6).timeout
	show_tutorial()

	# CONECTAR MUERTE DEL PLAYER
	if player:
		player.died.connect(_on_player_died)

func spawn_bugs() -> void:
	var spawner := $BugsSpawner
	if not spawner:
		return

	var bug_scene: PackedScene = spawner.bug_scene
	if not bug_scene:
		return

	var count := 5
	alive_bugs = 0
	game_ended = false

	var player := get_tree().get_first_node_in_group("player")
	if not player:
		return

	for i in range(count):
		var bug := bug_scene.instantiate()
		var offset := Vector2(randf_range(-200, 200), randf_range(-150, 150))
		bug.global_position = player.global_position + offset
		bug.tree_exited.connect(_on_bug_died)
		add_child(bug)
		alive_bugs += 1

func show_tutorial() -> void:
	if not GameState.tutorial_shown:
		var tutorial := preload("res://Scenes/main/tutorial.tscn").instantiate()
		$UILayer.add_child(tutorial)
		GameState.tutorial_shown = true

func _on_bug_died() -> void:
	if game_ended:
		return
	if tree_ref == null:
		return

	alive_bugs -= 1
	if alive_bugs > 0:
		return

	game_ended = true

	if Engine.has_singleton("MusicPlayer"):
		if "stop_game_music" in MusicPlayer:
			MusicPlayer.stop_game_music()

	if has_node("WinnerOverlay"):
		$WinnerOverlay.visible = true

	tree_ref.paused = true

func _on_player_died() -> void:
	if game_ended:
		return
	game_ended = true
	tree_ref.paused = false
	await SceneTransition.fade_to_scene("res://Scenes/loser/loser.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		if tree_ref.paused:
			tree_ref.paused = false
			if has_node("UILayer/PauseMenu"):
				$UILayer/PauseMenu.close()
		else:
			tree_ref.paused = true
			if has_node("UILayer/PauseMenu"):
				$UILayer/PauseMenu.open()
