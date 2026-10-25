extends Node

var player: AudioStreamPlayer

func _ready() -> void:
	player = AudioStreamPlayer.new()
	add_child(player)

	player.stream = preload("res://assets/Destination Mars.mp3")
	player.play()
	print("AudioManager initialized: ", get_instance_id())
	


func play_music_or_sound_effect(play_effect: bool = false) -> void:
	if play_effect:
		player.stop()
		player.stream = preload("res://assets/explosion.mp3")
		player.play()
	else:
		if player.stream != preload("res://assets/Destination Mars.mp3"):
			player.stream = preload("res://assets/Destination Mars.mp3")

		if not player.playing:
			player.play()
