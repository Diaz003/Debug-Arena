extends Control

@onready var pause_panel: Control = $PausePanel
@onready var options_panel: Control = $OptionsPanel
@onready var opciones_ui: Control = $OptionsPanel/Opciones  # <- aquí está la corrección

func _ready() -> void:
	visible = false
	_show_pause()
	opciones_ui.back_pressed.connect(_show_pause)

func open() -> void:
	visible = true
	get_tree().paused = true
	_show_pause()

func close() -> void:
	get_tree().paused = false
	visible = false

func _show_pause() -> void:
	pause_panel.visible = true
	options_panel.visible = false

func _show_options() -> void:
	pause_panel.visible = false
	options_panel.visible = true

func _on_resume_button_pressed() -> void:
	close()

func _on_options_button_pressed() -> void:
	_show_options()

func _on_menu_button_pressed() -> void:
	close()
	get_tree().change_scene_to_file("res://Scenes/menu/menu.tscn")
