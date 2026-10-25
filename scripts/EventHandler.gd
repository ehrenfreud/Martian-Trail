extends Node

@onready var event_ui = $"../EventUI"
@onready var player = $"../Player"
@onready var animated_sprite = $"../Player/AnimatedSprite2D"
@onready var world = $"../World"
@onready var timer = $"../Timer"
@onready var ui = $"../UI"

@onready var dustStormImage1 = $DustStormImage1
@onready var dustStormImage2 = $DustStormImage2
@onready var geysersImage1 = $GeysersImage1
@onready var geysersImage2 = $GeysersImage2
@onready var dustDevilImage1 = $DustDevilImage1
@onready var dustDevilImage2 = $DustDevilImage2
@onready var snowStormImage1 = $SnowStormImage1
@onready var snowStormImage2 = $SnowStormImage2
@onready var windStormImage1 = $WindStormImage1
@onready var windStormImage2 = $WindStormImage2
@onready var solarFlareImage1 = $SolarFlareImage1
@onready var solarFlareImage2 = $SolarFlareImage2

var list = ["dust_storm", "geysers", "solar flare", 
"dust_devils", "snow_storms", "wind_storms"]
var daysSinceEvent: int = 0
var solarFlare: bool = false

func callDustStorm() -> void:
	dustStormImage1.show()
	dustStormImage2.show()
	event_ui.show_message("Your P.A. beeps suddenly. The sharp trill snaps you out of your reverie.")
	await get_tree().create_timer(1.0).timeout
	event_ui.remove_message()
	event_ui.show_message("**BEEP BEEP!! WARNING: SOLAR FLARE INCOMING. PLEASE SEEK SHELTER!**")
	await get_tree().create_timer(1.0).timeout
	event_ui.remove_message()
	event_ui.show_message("Solar flares create extremely dangerous environments. Not only do they whip up strong storms on Mars's surface, but the acute radiation could cause fast and painful death through radiation poisoning. Your rover can set up strong radiation shielding, but in order to do it, it must stop moving. If you do, you might lose valuable time.")
	pass
func callGeysers() -> void:
	event_ui.show_message("geysers")
	geysersImage1.show()
	geysersImage2.show()
	pass
func callDustDevil() -> void:
	event_ui.show_message("dust devil")
	dustDevilImage1.show()
	dustDevilImage2.show()
	pass
func callSnowStorm() -> void:
	event_ui.show_message("snow storm")
	snowStormImage1.show()
	snowStormImage2.show()
	pass
func callWindStorm() -> void:
	event_ui.show_message("wind storm")
	windStormImage1.show()
	windStormImage2.show()
	pass
func callSolarFlare() -> void:
	event_ui.show_message("solar flare")
	solarFlareImage1.show()
	solarFlareImage2.show()


func step():
	if player.distanceFromBase < 3500 and solarFlare == false:
		daysSinceEvent = 0
		world.constant = 0
		timer.stop()
		ui.message.hide()
		callSolarFlare()
		solarFlare = true
		pass
	
	daysSinceEvent += 1
	if (randi()%100) < (0.5*daysSinceEvent*daysSinceEvent):
		daysSinceEvent = 0
		world.constant = 0
		timer.stop()
		ui.message.hide()
		match randi()%5:
			0: callDustStorm()
			1: callGeysers()
			2: callDustDevil()
			3: callSnowStorm()
			4: callWindStorm()
		animated_sprite.speed_scale = 0
		daysSinceEvent = 0


func restart():
	ui.message.show()
	timer.start()
	world.constant = 1
	dustStormImage1.hide()
	dustStormImage2.hide()
	geysersImage1.hide()
	geysersImage2.hide()
	dustDevilImage1.hide()
	dustDevilImage2.hide()
	snowStormImage1.hide()
	snowStormImage2.hide()
	windStormImage1.hide()
	windStormImage2.hide()
	solarFlareImage1.hide()
	solarFlareImage2.hide()
	animated_sprite.speed_scale = 1
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dustStormImage1.hide()
	dustStormImage2.hide()
	geysersImage1.hide()
	geysersImage2.hide()
	dustDevilImage1.hide()
	dustDevilImage2.hide()
	snowStormImage1.hide()
	snowStormImage2.hide()
	windStormImage1.hide()
	windStormImage2.hide()
	solarFlareImage1.hide()
	solarFlareImage2.hide()
	#await get_tree().create_timer(1.0).timeout 
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
