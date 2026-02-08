extends Control

@onready var sfx_player: AudioStreamPlayer = $SfxPlayer

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = false   # ← NO pausar al entrar en loser
	sfx_player.play()

func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	await SceneTransition.fade_to_scene("res://Scenes/main/main.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	await SceneTransition.fade_to_scene("res://Scenes/menu/menu.tscn")
