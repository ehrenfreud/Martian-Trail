extends Control

@onready var message: RichTextLabel = $Panel/Message
@onready var player = $"../Player"

var full_text: String = ""
var characters_shown: int = 0
var typing_speed: float = 0.035

func _ready() -> void:
	pass

func show_message(text: String) -> void:
	message.text = text

func _on_continue_pressed() -> void:
	hide()

func _process(delta: float) -> void:
	show_message("Distance: " + str(player.distanceFromBase))
