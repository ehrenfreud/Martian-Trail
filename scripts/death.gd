extends Node2D

@onready var ui = $"../UI"
@onready var player = $"../Player"
@onready var timer = $"../Timer"
@onready var world = $"../World"
@onready var deathMessage = $Panel/RichTextLabel

func death(message: String):
	AudioManager.play_music_or_sound_effect(true)
	timer.stop()
	player.hide()
	world.constant = 0
	$AnimatedSprite2D.show()
	$AnimatedSprite2D.play()
	await get_tree().create_timer(3.0).timeout
	$Panel.show()
	match message:
		"food":
			deathMessage.text = (
				"[center]You bang your fists against the dashboard, again and again. " +
				"You have no other outlet for this pain that has your body in a tight-fisted grip. " +
				"For the past few days, you have had nothing to eat. " +
				"In desperation, you drank from the reserves of water you pulled from the caverns, " +
				"but being unrefined they only caused you great pain.\n\n" +
				"Now, your body is shivering. " +
				"You feel full with a hole, a hole in your stomach through which your hope spills out. \n\n" +
				"Your vision darkens. \n\n\n" +
				"[b]GAME OVER[/b][/center]"
			)
			pass
		"oxygen":
			pass
		"battery":
			deathMessage.text = (
				"[center][b]WARNING! POWER RESERVES LOW![/b][/center] \n\n" +
				"     Panic grips your mind. You've been chasing the sunlight. You won't last until dawn. " +
				"Not with the power you have. If you can't recharge, you will die. You'll die for sure.
	 Flip a switch here, throw a lever there. Kicking the rover into high gear, " +
				"you chase the dying light as fast as you can. It's no use. " +
				"The faster you drive the rover, the more power it consumes. " +
				"It will never travel fast enough to catch the last flicker of hope on the horizon.
	 How unfortunate, that our pursuit for happiness is what dooms us in the end. " +
				"It's a tale as old as time.
	 When the light is snuffed out, the rover soon follows. There is no warning this time. " +
				"The lights simply flicker, and disappear.
     It's so dark.
     So, so dark.
	 The air is thinning around you. The last oxygen you have will not last you for long. " +
				"It will only last just long enough for your head to turn into a solid block of ice.
	 The cold seeps in slowly. The warmth of the craft runs away with the fleeing sun, " +
				"and your bones feel the chill immediately. The cold only gets worse.
	 It doesn't take long for the cold to numb any sensation in your body. You don't even feel it, " +
				"not only because your body froze, but because your brain froze with it.
     A perfectly preserved sculpture of hopelessness.
				[center][b]GAME OVER[/b][/center]"
			)
			pass
		"radiation":
			pass
		"geyser":
			deathMessage.text = (
				"\n\n\n\n\n\n[center]A blast of CO2 blew up near you, sending a chunk of ice flying into your rover. " +
				"Immediately, it let you know just how big of a problem you had. Warning lights flashed, " +
				"and alarms blared. Soon, your rover shut down. The damage was severe. It would never move again, " +
				"and neither will you. \n\n\n [b]GAME OVER[/b][/center]"
			)
			pass
	pass


func _ready() -> void:
	$AnimatedSprite2D.hide()
	$Panel.hide()
	pass

func _process(_delta: float) -> void:
	pass
