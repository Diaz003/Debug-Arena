extends AudioStreamPlayer

@export var menu_music: AudioStream
@export var game_music: AudioStream

func play_menu() -> void:
	if stream != menu_music:
		stream = menu_music
	play()

func play_game() -> void:
	if stream != game_music:
		stream = game_music
	play()

func stop_music() -> void:
	stop()
