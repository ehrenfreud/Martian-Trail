extends Node2D

@onready var player = get_parent().get_node("Player")
@onready var background = $Background1
var constant = 1

func _process(delta: float) -> void:
	position.x -= player.move_speed * delta * constant
	var texture_width = background.texture.get_width()
	
	var background_width = texture_width * background.scale.x

	if position.x <= -background_width:
		position.x += background_width
	elif position.x >= background_width:
		position.x -= background_width
	pass
