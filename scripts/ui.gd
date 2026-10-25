extends Control

@onready var message: RichTextLabel = $Panel/Message
@onready var stats: RichTextLabel = $Panel/Stats
@onready var player = $"../Player"

var full_text: String = ""
var characters_shown: int = 0
var typing_speed: float = 0.035

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	message.text = (
		"[center][b]~~~~~~~~~~~~~~~~~~~~|[/b] DAY %2s [b]|~~~~~~~~~~~~~~~~~~~~[/b]\n" %str(player.days) +
		"Distance from Martian Base: [b] %4s [/b] / 7000 km\n" %str(player.distanceFromBase) +
		"Remaining water:[b] " + str(player.water) + "%[/b][/center]"
		)
	stats.text = (
		"[center]---| STATS |---[/center]\n" + 
		"Hull Integrity: " + str(player.hull_integrity) + "%\n" +
		"Rover Power: " + str(player.power) + "%\n" +
		"Remaining Rations: %6.2f" %player.food + "%\n" +
		"Remaining Oxygen: %6.2f" %player.oxygen + "%"
		)
