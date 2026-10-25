extends Node

@onready var event_ui = $"../EventUI"
@onready var player = $"../Player"
@onready var animated_sprite = $"../Player/AnimatedSprite2D"
@onready var world = $"../World"
@onready var timer = $"../Timer"
@onready var ui = $"../UI"
@onready var death = $"../Death"

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

var currentEvent = ""

var list = ["dust_storm", "geysers", "solar flare", 
"dust_devils", "snow_storms", "wind_storms"]
var daysSinceEvent: int = 0
var solarFlare: bool = false

func callDustStorm() -> void:
	currentEvent = "DustStorm"
	dustStormImage1.show()
	dustStormImage2.show()
	event_ui.show_event_no_choices("The first thing you hear is the buzzing. 

Outside, great winds sweep up walls of dust, hurling them at the rover. An enormous storm has overtaken your vehicle. The red dust covers your craft.
")
	pass
func callGeysers() -> void:
	currentEvent = "Geysers"
	#event_ui.show_message("geysers")
	geysersImage1.show()
	geysersImage2.show()
	var choices: Array[String] = ["<> Press on through the polar caps.","<> Navigate around the polar ice caps."]
	var texts: Array[String] = ["**WARNING: POSSIBLE GEYSERS AHEAD!**", "You remember what little you can from your lessons on Mars. When the sun heats up dry ice underneath the polar caps, pockets of pressure build up- bursting outwards as geysers of pressurized CO2 and debris. If you press through the field, you'll continue as the plan entails, but debris from a geyser may damage your rover. If a serious blow is dealt to your rover, you don't know if you'll even be able to repair it"]
	event_ui.show_event_array(texts, choices)
	
	
	pass
func callDustDevil() -> void:
	currentEvent = "DustDevil"
	#event_ui.show_message("dust devil")
	dustDevilImage1.show()
	dustDevilImage2.show()
	event_ui.show_event_no_choices("Your rover spurs on at a steady pace. Everything seems to be according to plan. However, something's going on outside. The warm sun beaming down on the barren earth has created an updraft, and dust devils have formed around your rover before you have even realized.")
	pass
func callSnowStorm() -> void:
	currentEvent = "SnowStorm"
	#event_ui.show_message("snow storm")
	snowStormImage1.show()
	snowStormImage2.show()
	var choices: Array[String] = ["<>Divert power to heater", "<>Thug it out"]
	event_ui.show_event("Frost starts to form on your windshield. Naturally, you were prepared for this. As the heaters fire up, the ice melts away. Unfortunately, it wasn't just happening on your windshield. Before your eyes, light dustings of snow start to cover the landscape around you.", choices)
	pass
func callWindStorm() -> void:
	currentEvent = "WindStorm"
	#event_ui.show_message("wind storm")
	windStormImage1.show()
	windStormImage2.show()
	event_ui.show_event_no_choices("Wind gusts start to pick up and billow dust that covers solar panels")
	
	
	pass
func callSolarFlare() -> void:
	currentEvent = "SolarFlare"
	#event_ui.show_event("solar flare")
	solarFlareImage1.show()
	solarFlareImage2.show()
	var choices: Array[String] = ["<> Play it safe: Hunker down","<> Risk it: Brave the solar flare"]
	event_ui.show_event("**BEEP BEEP!! WARNING: SOLAR FLARE INCOMING. PLEASE SEEK SHELTER!**", 
	choices)

func on_choice_selected(index: int) -> void:
	print("HELLO")
	match currentEvent:
		"SolarFlare":
			if index == 0:
				print("son?")
				event_ui.type_message("** The lights dim as your rover retracts into itself. You feel a pang in your chest, thinking about the time you might lose… but at least you know you'll be safe. ")
				event_ui.continue_button()
			elif index == 1:
				player.radiation = true
				if randi() % 2 == 0:
					event_ui.type_message("SUCCESS: The rover presses on. While you can't dismiss the gnawing feeling in your stomach, you chalk it up to anxiety rather than radiation poisoning. You can't stop here: you must return.")
					event_ui.continue_button()
				else:
					event_ui.type_two_messages("FAILURE: You continue onwards. It only takes a minute before you feel immense nausea in your stomach. It progresses to a rending pain in your chest, then the rest of your body. Your cells, one by one, are crumbling… you feel fatigued. You are so, so… tired. Your eyelids close, and you collapse onto the terminal. The last thing you do before you give in to your exhaustion is slam the button, initializing the shutdown sequence. You have gained some ground, but at what cost?",
					"…

You open your eyes a day or two later. You feel… fine?")
					event_ui.continue_button()
				# Apply this choice's effects.
		"DustDevil":
			if randi() % 2 == 0:
					event_ui.type_message("SUCCESS: Gritting your teeth, you push onwards. The swirling dust ended up being not as intense as you originally thought. When the dust devils came over your rover, they passed after merely light tremors. When the ordeal was complete, your craft had been wiped clean by the drafts. Maybe now, you wouldn't have to worry too much about power, at least for a small time.
					")
					
					event_ui.continue_button()

			else:
					event_ui.type_message("FAILURE: Another dust devil spins up, then another. Before you knew it, you were overcome by the swirling dust. You couldn't see a thing. The windows weren't the only thing being covered with dirt, though. Filtration systems were clogged. It took you a long time before you were ready to continue onwards.
					-25% Power")
					player.power -= 25

					event_ui.continue_button()
		"DustStorm":
			if randi() % 2 == 0:
					event_ui.type_message("SUCCESS: Fierce winds blow at you. Your rover is forced to shut down temporarily.
The dust storm ends a few days later. You can move on.
-10% Power")
					player.power -= 20

					
					
					event_ui.continue_button()

			else:
					event_ui.type_message("FAILURE: The immense walls of dust cloud the systems and invade every crevice. The storm doesn't fade for a whole week. When it finally does, it takes you an entire day to clean the dust away and get the rover moving again.
-20% Power")

					player.power -= 40
					event_ui.continue_button()
		"WindStorm":
			restart()
			callDustStorm()
		"SnowStorm":
			if index == 0:
				event_ui.type_message("The dusting of snow affects your vehicle little. As the frost forms around you, you are moved with wonder. Even on a distant planet like this, there were sights to behold. It makes you a little more hopeful about the journey ahead of you.
-10% Power")
				player.power -= 10
				event_ui.continue_button()
			if index == 1:
				event_ui.type_message("FAILURE: Before you knew it, frost had overcome your windshield. It started getting much colder in the rover, almost unbearably so. 
				
It takes hours for the storm to pass. The cold got to you. You had to eat extra rations just to feel full.
-20% Rations
")
				player.rations -= 20
				event_ui.continue_button()
		"Geysers":
			if index == 0:
				if randi() % 2 == 0:
					event_ui.type_message("SUCCESS: By sheer luck, you dodge any possible ruination, saving yourself from an unfortunate end. It takes you a week, but you emerge on the other side of the polar caps unharmed.")
					event_ui.continue_button()
				else:
					death.death("geyser")
					#event_ui.type_message("FAILURE: A blast of CO2 blew up near you, sending a chunk of ice flying into your rover. Immediately, it let you know just how big of a problem you had. Warning lights flashed, and alarms blared. Soon, your rover shut down. The damage was severe. It would never move again, and neither will you.")
					#event_ui.continue_button()
			if index == 1:
				event_ui.type_message("You can't risk your life. Not when the threat of death is always looming over you. You spread a worksheet over your terminal, and calculate the new path.")
				event_ui.continue_button()
				
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
			0: callGeysers()#callDustStorm()
			1: callGeysers() 
			2: callGeysers()#callDustDevil()
			3: callGeysers()#callSnowStorm()
			4: callGeysers()#callDustDevil()
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
	event_ui.choice_selected.connect(on_choice_selected)
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
