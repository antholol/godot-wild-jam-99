extends Node2D
@onready var daysPassedLabel: Label = $CanvasLayer/ColorRect/VBoxContainer/daysPassedLabel
@onready var heat_bar: ProgressBar = $"CanvasLayer/Heat Bar"

var daysPassed: int = 0
var heat: float = 0.00

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dayCounter(daysPassed)
	daysPassed = 1
	heat=23.46
	changeHeat(heat)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
		
func changeHeat(heat: float) -> void:
	heat_bar.value = heat

func dayCounter(daysPassed: int) -> void:
	daysPassedLabel.text = "Day " + str(daysPassed)
