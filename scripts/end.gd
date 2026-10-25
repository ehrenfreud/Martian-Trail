extends Node2D

@onready var winMessage = $Panel/RichTextLabel
@onready var player = $"../Player"

func win():
	$AnimatedSprite2D.show()
	$AnimatedSprite2D.play()
	await get_tree().create_timer(4.0).timeout
	$Panel.show()
	if player.radiation == false:
		winMessage.text = (
			"[center]You feel tears of joy welling up in your eyes as you spy the dome in the distance. " +
			"The water in your tankard will save lives, but more importantly right now, your life is saved, too. " +
			"You roll your rover into the dock. \n
			As you take heavy steps, you can feel exhaustion creeping into your limbs from the journey. " +
			"Your entire body is sighing with relief. Scientists, researchers, " +
			"and fellow explorers alike rush forward, greeting you as you arrive. You are too tired to hear them. " +
			"Collapsing into their arms, you can finally rest easy… knowing that your actions carried great importance. \n
			Humanity may struggle, and some may die. But it is part of our nature to struggle, to persevere. " +
			"To push ever outwards, to conquer new frontiers. Throughout history, " +
			"this will of ours has been used to help and to harm. However, under the right hand, it can always do incredible things. \n
			Congratulations, astronaut. To some, this is a small victory. But every small victory is part of the struggle that never ends. " +
			"It is because this struggle never ends, that we find respite in the peaks, the moments of victory and achievement. Remember this. \n
			[b]ENDING: LIVE IN FAME[/b] \nREMAINING WATER: %5.2f" %player.water + "%"
		)
	else:
		winMessage.text = (
			"     You feel tears of joy welling up in your eyes as you spy the dome in the distance. The water in your tankard will save lives, " +
			"but more importantly right now, your life is saved, too. You roll your rover into the dock. 
	 As you take heavy steps, you can feel exhaustion creeping into your limbs from the journey. Scientists, researchers, and fellow explorers alike rush forward, " +
			"greeting you as you arrive. You are too tired to hear them. Collapsing into their arms, your body sighs with relief. \n
     Or does it? 
	 By some cruel twist of fate, as soon as you allow yourself to relax, it hits you. Pain, tearing through your body. Your cells, rent by radiation, " +
			"reveal their last cruel play:
     For the past few weeks, you have been a dead man walking. 
	 You are hospitalized immediately, but it is too late for you. Damage to the nervous and gastrointestinal systems have left you inert. " +
			"While scientists gather around you, giving you care, it is an illusion. They are easing the pain of your passing. 
	 Sometimes, sacrifices are made. Many argue that sacrifices are not necessary. Progress can be made without death. " +
			"It is a sign of a lesser researcher to believe something as foolish as “death is necessary”. Yet, people still die. 
	 It's not anyone's fault in particular. Who could blame them? They were merely pressing horizons, as they must. " +
			"It is only natural. Humanity is almost self-destructive in their resolve to expand outwards. " +
			"That relentless curiosity to know the universe and by extension ourselves is one that has built us and destroyed us time and time again. 
	 You lie on that bed, your body suffused with numbness as everything fades to black. You have met an untimely end, " +
			"but you have undoubtedly made your mark on the world. You have saved lives, at the expense of yours. \n
     Good work, astronaut. And good night, our pioneer. \n
	[center][b]ENDING: DOWN IN FLAME[/b] \nREMAINING WATER: %5.2f" %player.water + "%"
		)
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.hide()
	$Panel.hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
