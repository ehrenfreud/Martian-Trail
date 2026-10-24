extends Control

@onready var message: RichTextLabel = $Panel/Message
@onready var continue_button: Button = $Panel/Button

var full_text: String = ""
var characters_shown: int = 0
var typing_speed: float = 0.035

func _ready() -> void:
	hide()
	continue_button.pressed.connect(_on_continue_pressed)

func show_message(text: String) -> void:
	full_text = text
	characters_shown = 0
	message.text = ""
	show()
	_type_message()

func _type_message() -> void:
	while characters_shown < full_text.length():
		message.append_text(full_text[characters_shown])
		characters_shown += 1
		await get_tree().create_timer(typing_speed).timeout

func _on_continue_pressed() -> void:
	hide()
