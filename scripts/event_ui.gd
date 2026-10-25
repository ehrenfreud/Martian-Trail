extends Control

@onready var message: RichTextLabel = $Panel/Message
@onready var continueButton: Button = $Panel/Button
@onready var timer: Timer = $"../Timer"
@onready var eventHandler = $"../EventHandler"

var typing_speed: float = 0.035

func _ready() -> void:
	hide()
	continueButton.pressed.connect(_on_continue_pressed)

func show_message(text: String) -> void:
	message.text = ""
	show()
	for i in text:
		message.append_text(i)
		await get_tree().create_timer(typing_speed).timeout

func _on_continue_pressed() -> void:
	eventHandler.restart()
	hide()
