extends AudioStreamPlayer

@export var fade_duration := 1.0

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func play_menu_music() -> void:
	var menu_stream := preload("res://Audio/fondo_menu.mp3")
	if stream != menu_stream:
		await _fade_out()              
		stream = menu_stream
		volume_db = -10.0             
	await _fade_in()                   

func play_game_music() -> void:
	var game_stream := preload("res://Audio/fondo_game.mp3")
	if stream != game_stream:
		await _fade_out()
		stream = game_stream
		volume_db = -15.0              
	await _fade_in()

func stop_music() -> void:
	await _fade_out()
	stop()


func _fade_in() -> void:
	var target_volume := volume_db    
	volume_db = -80.0                
	if not playing:
		play()
	var tween := create_tween()
	tween.tween_property(self, "volume_db", target_volume, fade_duration)
	await tween.finished            

func _fade_out() -> void:
	if not playing:
		return
	var tween := create_tween()
	tween.tween_property(self, "volume_db", -80.0, fade_duration)
	await tween.finished
