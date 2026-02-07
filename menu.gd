extends Control

@onready var main_panel: Control = $MainPanel
@onready var options_panel: Control = $OptionsPanel
@onready var opciones_ui: Control = $OptionsPanel/Opciones

func _ready() -> void:
	_show_main()
	MusicPlayer.play_menu_music()
	if opciones_ui and opciones_ui.has_signal("back_pressed"):
		opciones_ui.back_pressed.connect(_show_main)

func _input(event: InputEvent) -> void:
	if options_panel.visible and event.is_action_pressed("menu"):
		_show_main()
		get_viewport().set_input_as_handled()  # <- SOLO aquí, dentro del if

func _show_main() -> void:
	main_panel.visible = true
	options_panel.visible = false

func _show_options() -> void:
	main_panel.visible = false
	options_panel.visible = true

func _on_play_button_pressed() -> void:
	if MusicPlayer.playing:
		await MusicPlayer.stop_music()
	await SceneTransition.fade_to_scene("res://Scenes/main/main.tscn")


func _on_settings_button_pressed() -> void:
	_show_options()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
