extends Node2D
@onready var daysPassedLabel: Label = $CanvasLayer/ColorRect/VBoxContainer/daysPassedLabel
@onready var heat_bar: ProgressBar = $"CanvasLayer/Heat Bar"
@onready var heat_val_label: Label = $"CanvasLayer/Heat Bar/heatValLabel"

var count:int = 0
@export var myGradient: Gradient

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	count = count + 1
	Global.daysPassed = count
	Global.heat = count
	dayCounter(Global.daysPassed)
	changeHeat(Global.heat)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
		
func changeHeat(heat: float) -> void:
	heat_val_label.text = str(int(heat))
	heat_bar.value = heat
	heat_bar.modulate = myGradient.sample(1 * 0.01 * heat)
	#heat_bar.modulate = Color((1 * 0.01 * heat),0,(1 * 0.01 * (100 - heat)),1)
	
func dayCounter(daysPassed: int) -> void:
	daysPassedLabel.text = "Day " + str(daysPassed)
