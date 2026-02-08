extends Control

@onready var options_panel: Control = $OptionsPanel
@onready var opciones_ui: Control = $OptionsPanel/Opciones
@onready var main_buttons: Control = $ButtonsBox
@onready var pause_title: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	visible = false
	if opciones_ui and opciones_ui.has_signal("back_pressed"):
		opciones_ui.back_pressed.connect(_show_pause)

func _input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("menu"):
		if options_panel.visible:
			_show_pause()
		else:
			close()
		get_viewport().set_input_as_handled()

func open() -> void:
	visible = true
	get_tree().paused = true
	_show_pause()

func close() -> void:
	get_tree().paused = false
	visible = false

func _show_pause() -> void:
	main_buttons.visible = true
	pause_title.visible = true
	options_panel.visible = false

func _show_options() -> void:
	main_buttons.visible = false
	pause_title.visible = false
	options_panel.visible = true

func _on_resume_button_pressed() -> void:
	close()

func _on_options_button_pressed() -> void:
	_show_options()

func _on_menu_button_pressed() -> void:
	var main := get_tree().get_first_node_in_group("main")  
	if main and ("game_ended" in main):
		main.game_ended = true

	get_tree().paused = false
	await SceneTransition.fade_to_scene("res://Scenes/menu/menu.tscn")
