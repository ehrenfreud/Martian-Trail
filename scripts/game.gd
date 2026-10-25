extends Node2D
@onready var EventHandler = $EventHandler
@onready var event_ui = $EventUI
@onready var ui = $UI
@onready var player = $Player
@onready var death = $Death

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	pass

func step(num: int):
	if player.distanceFromBase < 0:
		win()
		pass
	player.days += 1*num
	player.food -= 1.4*num
	player.oxygen -= 1.6*num
	player.battery += 1*num
	player.health -= player.healthLoss
	if player.battery > 100:
		player.battery = 100
	
	if player.hunger < 0:
		player.healthLoss = 10
	
	if player.battery < 0:
		death.death("battery")
	elif player.oxygen < 0:
		death.death("oxygen")
	elif player.health < 0:
		if player.radiation:
			death.death("radiation")
		else:
			death.death("food")
	
	if player.moving:
		player.distanceFromBase -= 160
	player.water -= 0.25
	if num == 1:
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
	step(1)
	pass
