extends Node

@onready var event_ui = $"../EventUI"
@onready var player = $"../Player"
@onready var world = $"../World"
var eventHappening: bool = false
var list = ["dust_storm", "geysers", "solar flare", 
"dust_devils", "snow_storms", "wind_storms"]

func _callDustStorm() -> void:
	world.constant = 0
	event_ui.show_message("hello")
	player.hull_integrity -= 20
	pass
func _callGeysers() -> void:
	pass
func _callDustDevil() -> void:
	pass
func _callSnowStorm() -> void:
	pass
func _callWindStorm() -> void:
	pass
func _callSolarFlare() -> void:
	pass
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#_callDustStorm()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
