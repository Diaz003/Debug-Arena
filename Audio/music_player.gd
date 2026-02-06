extends AudioStreamPlayer

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS 

func play_menu_music() -> void:
	var menu_stream := preload("res://Audio/fondo_menu.mp3")
	if stream != menu_stream:
		stream = menu_stream
	if not playing:
		play()

func play_game_music() -> void:
	var game_stream := preload("res://Audio/fondo_game.mp3")
	if stream != game_stream:
		stream = game_stream
	volume_db = -15.0 
	if not playing:
		play()

func stop_music() -> void:
	stop()
