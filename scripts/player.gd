extends CharacterBody2D

@export_range(0.0, 100.0) var health: float = 100.0

@export_range(0.0, 100.0) var food: float = 100.0
@export_range(0.0, 100.0) var oxygen: float = 100.0
@export_range(0.0, 100.0) var battery: float = 10.0
@export_range(0.0, 100.0) var water: float = 100.0
@export_range(0.0, 100.0) var hull_integrity: float = 100.0

var distance_from_base: int = 7000
var days: int = 0

@export var move_speed: float = 100.0

func _ready() -> void:
	print("Mars expedition initialized!")
	print("Health: ", health)
	print("Water: ", water)
	

# Keep your existing expedition variables above or below this.

func _physics_process(_delta: float) -> void:
	pass
