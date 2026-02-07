extends CanvasLayer

@onready var fade: ColorRect = $Fade

func _ready() -> void:
	fade.visible = false

func fade_to_scene(target_scene: String) -> void:
	print("FADE TO SCENE START")
	fade.visible = true
	var tween := create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, 0.8) # antes 2.0
	await tween.finished
	print("FADE BLACK END, CHANGE SCENE")
	get_tree().change_scene_to_file(target_scene)
	await fade_in()
	print("FADE IN END")

func fade_in() -> void:
	fade.visible = true
	fade.modulate.a = 1.0
	var tween := create_tween()
	tween.tween_property(fade, "modulate:a", 0.0, 0.5) # antes 1.0
	await tween.finished
	fade.visible = false
