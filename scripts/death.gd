extends Node2D

@onready var ui = $"../UI"

func death():
	$"../Timer".stop()
	$"../Player".hide()
	pass


func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	pass
