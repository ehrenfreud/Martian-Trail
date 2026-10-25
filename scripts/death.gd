extends Node2D

@onready var ui = $"../UI"
@onready var player = $"../Player"
@onready var timer = $"../Timer"

func death():
	timer.stop()
	player.hide()
	show()
	$AnimatedSprite2D.play()
	pass


func _ready() -> void:
	hide()
	pass

func _process(_delta: float) -> void:
	if player.days == 3:
		death()
	pass
