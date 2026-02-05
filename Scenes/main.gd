extends Node2D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		if get_tree().paused:
			$UILayer/PauseMenu.close()
		else:
			$UILayer/PauseMenu.open()
