extends Control

func _ready() -> void:
	visible = false # se abre con open()

func open() -> void:
	visible = true
	get_tree().paused = true

func close() -> void:
	get_tree().paused = false
	visible = false

func _on_resume_button_pressed() -> void:
	close()

func _on_options_button_pressed() -> void:
	GameState.return_scene_path = "res://Scenes/main.tscn"
	close()
	get_tree().change_scene_to_file("res://Scenes/opciones.tscn")

func _on_menu_button_pressed() -> void:
	close()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
