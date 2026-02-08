extends CanvasLayer

@onready var fade: ColorRect = $Fade

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	fade.visible = false
	fade.modulate.a = 0.0


func fade_to_scene(target_scene: String) -> void:
	fade.visible = true
	fade.modulate.a = 0.0

	var tween := create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, 0.8) 
	await tween.finished

	get_tree().change_scene_to_file(target_scene)
	await fade_in()

func fade_in() -> void:
	fade.visible = true
	fade.modulate.a = 1.0

	var tween := create_tween()
	tween.tween_property(fade, "modulate:a", 0.0, 0.5)
	await tween.finished

	fade.modulate.a = 0.0
	fade.visible = false
