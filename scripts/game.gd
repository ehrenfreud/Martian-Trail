extends Node2D
@onready var EventHandler = $EventHandler
@onready var event_ui = $EventUI
@onready var ui = $UI
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#event_ui.show_message("A dust storm is approaching your rover!")
	pass

func step():
	if player.distanceFromBase < 0:
		win()
		pass
	player.days += 1
	player.food -= 1.6
	player.oxygen -= 1.4
	player.battery += 2
	if player.battery > 100:
		player.battery = 100
	if player.moving:
		player.distanceFromBase -= 160
	player.water -= 0.25
	EventHandler.step()
	pass

func win():
	$Timer.stop()
	ui.message.hide()
	ui.stats.hide()
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	step()
	pass
