extends Control

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = true
	get_tree().paused = true


func _on_button_pressed() -> void:
	get_tree().paused = false
	queue_free()
