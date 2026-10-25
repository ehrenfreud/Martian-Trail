extends Node2D
@onready var EventHandler = $EventHandler
@onready var event_ui = $EventUI
@onready var ui = $UI
@onready var player = $Player
@onready var death = $Death
@onready var end = $End

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	pass

func step(num: int):
	if player.distanceFromBase < 160:
		win()
		pass
	else:
		player.days += 1*num
		player.food -= 1.4*num
		player.oxygen -= 1.6*num
		player.power += 1*num
		player.health -= player.healthLoss*num
		player.water -= 0.25*num
		if player.power > 100:
			player.power = 100
		
		if player.food < 0:
			player.healthLoss = 10
		
		if player.power < 0:
			death.death("battery")
		elif player.oxygen < 0:
			death.death("oxygen")
		elif player.health < 0:
			if player.radiation:
				death.death("radiation")
			else:
				death.death("food")
		
		if num == 1:
			player.distanceFromBase -= 160
		EventHandler.step()
	pass

func win():
	$Timer.stop()
	ui.message.hide()
	ui.stats.hide()
	end.win()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	step(1)
	pass
