extends Node2D

func _ready() -> void:
	MusicPlayer.play_game_music()

func show_tutorial() -> void:
	if not GameState.tutorial_shown:
		var tutorial := preload("res://Scenes/main/tutorial.tscn").instantiate()
		$UILayer.add_child(tutorial)
		GameState.tutorial_shown = true

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		if get_tree().paused:
			$UILayer/PauseMenu.close()
		else:
			$UILayer/PauseMenu.open()
