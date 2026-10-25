extends Node

@onready var event_ui = $"../EventUI"
@onready var player = $"../Player"
@onready var world = $"../World"
@onready var timer = $"../Timer"
@onready var ui = $"../UI"

@onready var dust_storm_image = $DustStorm
var list = ["dust_storm", "geysers", "solar flare", 
"dust_devils", "snow_storms", "wind_storms"]
var daysSinceEvent: int = 0


func callDustStorm() -> void:
	event_ui.show_message("dust storm")
	dust_storm_image.show()
	pass
func callGeysers() -> void:
	event_ui.show_message("geysers")
	pass
func callDustDevil() -> void:
	event_ui.show_message("dust devil")
	pass
func callSnowStorm() -> void:
	event_ui.show_message("snow storm")
	pass
func callWindStorm() -> void:
	event_ui.show_message("wind storm")
	pass
func callSolarFlare() -> void:
	event_ui.show_message("solar flare")
	pass


func step():
	daysSinceEvent += 1
	if (randi()%100) < (daysSinceEvent*5):
		world.constant = 0
		timer.stop()
		ui.hide()
		match randi()%5:
			0: callDustStorm()
			1: callGeysers()
			2: callDustDevil()
			3: callSnowStorm()
			4: callWindStorm()
		daysSinceEvent = 0
	pass

func restart():
	ui.show()
	timer.start()
	world.constant = 1
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#hides events on start
	dust_storm_image.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
