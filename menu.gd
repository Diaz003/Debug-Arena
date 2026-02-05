extends Control

func _on_play_button_pressed() -> void:
	MusicPlayer.stop()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_settings_button_pressed() -> void:
	GameState.return_scene_path = "res://Scenes/menu.tscn"
	get_tree().change_scene_to_file("res://Scenes/opciones.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
