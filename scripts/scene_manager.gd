extends Node2D

var game: PackedScene = preload("res://scenes/game.tscn")
var current_scene: Node = null
var titleScreen: PackedScene = preload("res://scenes/title_screen.tscn")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_scene = titleScreen.instantiate()
	current_scene.start_pressed.connect(start_game)
	add_child(current_scene)
	
	

func start_game() -> void:
	current_scene.queue_free()
	current_scene = game.instantiate()
	add_child(current_scene)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
