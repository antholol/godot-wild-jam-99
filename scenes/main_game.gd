extends Node2D
@onready var daysPassedLabel: Label = $CanvasLayer/ColorRect/VBoxContainer/daysPassedLabel

var daysPassed: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dayCounter(daysPassed)
	daysPassed = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
		

func dayCounter(daysPassed: int) -> void:
	daysPassedLabel.text = "Day " + str(daysPassed)
