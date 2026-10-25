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
	player.food -= 1.6
	if player.moving:
		player.distanceFromBase -= 160
	player.water -= 0.25
	EventHandler.step()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	step()
	pass
