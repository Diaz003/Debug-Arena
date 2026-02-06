extends Control

@onready var main_panel: Control = $MainPanel
@onready var options_panel: Control = $OptionsPanel
@onready var opciones_ui: Control = $OptionsPanel/Opciones  # ajusta nombre si no coincide

func _ready() -> void:
	_show_main()
	opciones_ui.back_pressed.connect(_show_main)

func _show_main() -> void:
	main_panel.visible = true
	options_panel.visible = false

func _show_options() -> void:
	main_panel.visible = false
	options_panel.visible = true

func _on_play_button_pressed() -> void:
	MusicPlayer.stop()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_settings_button_pressed() -> void:
	_show_options()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
