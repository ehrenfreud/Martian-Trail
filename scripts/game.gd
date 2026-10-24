extends Node2D

@onready var event_ui = $EventUI
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	event_ui.show_message("A dust storm is approaching your rover!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
