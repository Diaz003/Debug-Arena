extends Control

@onready var sfx_player: AudioStreamPlayer = $SfxPlayer

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	sfx_player.play()

func _on_exit_button_pressed() -> void:
	var main := get_tree().get_first_node_in_group("main")  
	if main and ("game_ended" in main):
		main.game_ended = true

	get_tree().paused = false
	await SceneTransition.fade_to_scene("res://Scenes/menu/menu.tscn")
