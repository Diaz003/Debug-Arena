extends Control

@onready var fullscreen_btn: Button = $MarginContainer/VBoxContainer/FullscreenButton

func _ready() -> void:
	_update_fullscreen_text()

func _on_fullscreen_button_pressed() -> void:
	var is_full := DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	DisplayServer.window_set_mode(
		DisplayServer.WINDOW_MODE_WINDOWED if is_full else DisplayServer.WINDOW_MODE_FULLSCREEN
	)
	_update_fullscreen_text()

func _update_fullscreen_text() -> void:
	var is_full := DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	fullscreen_btn.text = "Fullscreen: " + ("ON" if is_full else "OFF")

func _on_quit_options_button_pressed() -> void:
	get_tree().change_scene_to_file(GameState.return_scene_path)
