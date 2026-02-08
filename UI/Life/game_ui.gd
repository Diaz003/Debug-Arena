extends Control

@onready var health_bar: ProgressBar = $HealthBar

func _ready() -> void:
	var player := get_tree().get_first_node_in_group("player")
	if player:
		player.health_changed.connect(_on_player_health_changed)
		_on_player_health_changed(player.health, player.max_health)

func _on_player_health_changed(current_health: int, max_health: int) -> void:
	health_bar.max_value = max_health
	health_bar.value = current_health
