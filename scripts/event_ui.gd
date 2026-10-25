extends Control

@onready var message: RichTextLabel = $Panel/Message
@onready var continueButton: Button = $Panel/Button1
@onready var timer: Timer = $"../Timer"
@onready var eventHandler = $"../EventHandler"

var typing_speed: float = 0.065

func _ready() -> void:
	hide()
	continueButton.pressed.connect(_on_continue_pressed)

func show_message(text: String) -> void:
	message.text = ""
	show()
	for i in text:
		message.append_text(i)
		await get_tree().create_timer(typing_speed).timeout
	
		
func remove_message() -> void:
	message.text = ""

func _on_continue_pressed() -> void:
	eventHandler.restart()
	hide()
