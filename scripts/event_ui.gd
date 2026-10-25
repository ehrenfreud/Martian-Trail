extends Control

@onready var message: RichTextLabel = $Panel/Message
@onready var button1: Button = $Panel/Button1
@onready var button2: Button = $Panel/Button2
@onready var continueButton: Button = $Panel/Continue
@onready var timer: Timer = $"../Timer"
@onready var eventHandler = $"../EventHandler"

var typing_speed: float = 0.03 #was 0.065
var is_typing = false

signal choice_selected(choice_index: int)

@onready var buttons: Array[Button] = [
	$Panel/Button1,
	$Panel/Button2,
	
]



func _ready() -> void:
	continueButton.visible = false
	hide()
	continueButton.pressed.connect(on_continue_pressed)
	
func show_event(text: String, choices: Array[String]) -> void:
	is_typing = true
	message.text = ""
	show()
	
	for i in range(buttons.size()):
		buttons[i].text = choices[i]
		print(i)
		buttons[i].show()
		buttons[i].disabled = true
		
		
			
	for i in range(buttons.size()):
		buttons[i].pressed.connect(on_choice_pressed.bind(i))
	type_message(text)

func show_event_no_choices(text: String) -> void:
	is_typing = true
	message.text = ""
	show()
	
	for i in range(buttons.size()):
		buttons[i].text = "Continue"
		print(i)
		buttons[i].show()
		buttons[i].disabled = true
		
		
			
	for i in range(buttons.size()):
		buttons[i].pressed.connect(on_choice_pressed.bind(i))
	type_message(text)

func show_event_array(texts: Array[String], choices: Array[String]) -> void:
	is_typing = true
	message.text = ""
	show()
	
	for i in range(buttons.size()):
		buttons[i].text = choices[i]
		print(i)
		buttons[i].show()
		buttons[i].disabled = true
		
		
			
	for i in range(buttons.size()):
		buttons[i].pressed.connect(on_choice_pressed.bind(i))
	type_message_array(texts)
	


func type_message_array(texts: Array[String]) -> void:
	show()
	remove_message()
	is_typing = true
	
	for i in range(texts.size() - 1):
		for j in texts[i]:
			message.append_text(j)
			await get_tree().create_timer(typing_speed).timeout
		await get_tree().create_timer(1).timeout
		remove_message()
	for j in texts[texts.size()-1]:
		message.append_text(j)
		await get_tree().create_timer(typing_speed).timeout

	is_typing = false
	
	for button in buttons:
		button.disabled = false

func type_message(text: String) -> void:
	show()
	remove_message()
	is_typing = true
	
	for i in text:
		message.append_text(i)
		await get_tree().create_timer(typing_speed).timeout
		

	is_typing = false
	
	for button in buttons:
		button.disabled = false


func type_two_messages(text: String, text2: String) -> void:
	show()
	remove_message()
	is_typing = true

	for i in text:
		message.append_text(i)
		await get_tree().create_timer(typing_speed).timeout
	
	remove_message()
	
	for i in text2:
		message.append_text(i)
		await get_tree().create_timer(typing_speed).timeout

	is_typing = false
	
	for button in buttons:
		button.disabled = false
	
	
func on_choice_pressed(index: int) -> void:
	if is_typing:
		return
	print("button index: " + str(index))
	choice_selected.emit(index)

func continue_button() -> void:
	continueButton.visible = true
	button1.visible = false
	button2.visible = false

	
	
		
func remove_message() -> void:
	message.text = ""

func on_continue_pressed() -> void:
	continueButton.visible = false
	eventHandler.restart()
	hide()
	
