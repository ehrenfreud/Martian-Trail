extends Node2D
@onready var EventHandler = $EventHandler
@onready var event_ui = $EventUI
@onready var player = $Player

var frames: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#event_ui.show_message("A dust storm is approaching your rover!")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if EventHandler.eventHappening != true:
		frames += 1
		
		if frames%60 == 0:
			player.distance_from_base -= 160
			player.days += 1
			print(player.distance_from_base)
			pass
			
		pass
	
	pass
