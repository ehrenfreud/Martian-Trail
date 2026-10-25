extends Node2D
@onready var EventHandler = $EventHandler
@onready var event_ui = $EventUI
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#event_ui.show_message("A dust storm is approaching your rover!")
	pass

func step():
	player.days += 1
	print(player.distanceFromBase)
	if player.moving:
		player.distanceFromBase -= 160
	EventHandler.step()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	step()
	pass
