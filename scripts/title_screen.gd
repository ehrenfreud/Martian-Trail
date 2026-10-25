extends Control

signal start_pressed

@onready var startButton: Button = $Start
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startButton.pressed.connect(on_start_pressed)
	pass # Replace with function body.

func on_start_pressed() -> void:
	start_pressed.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
