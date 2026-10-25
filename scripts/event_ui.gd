extends Control

@onready var message: RichTextLabel = $Panel/Message
@onready var continueButton: Button = $Panel/Button1
@onready var timer: Timer = $"../Timer"
@onready var eventHandler = $"../EventHandler"

var typing_speed: float = 0.065
var is_typing = false

@onready var buttons: Array[Button] = [
	$Panel/Choices/Button1,
	$Panel/Choices/Button2,
	$Panel/Choices/Button3
]

func _ready() -> void:
	hide()
	continueButton.pressed.connect(_on_continue_pressed)

func show_message(text: String) -> void:
	is_typing = true
	message.text = ""
	show()
	for i in text:
		message.append_text(i)
		await get_tree().create_timer(typing_speed).timeout
	is_typing = false
	
		
func remove_message() -> void:
	message.text = ""

func _on_continue_pressed() -> void:
	eventHandler.restart()
	hide()
