extends Node2D
@onready var daysPassedLabel: Label = $CanvasLayer/ColorRect/VBoxContainer/daysPassedLabel
@onready var heat_bar: ProgressBar = $"CanvasLayer/Heat Bar"
@onready var heat_val_label: Label = $"CanvasLayer/Heat Bar/heatValLabel"
@export var myGradient: Gradient

var gameTimeInSeconds: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.heat = 50.00
	Global.daysPassed = 0
	Global.startTime = Time.get_ticks_msec()
	 
func _physics_process(delta: float) -> void:
	Global.currentTime = Time.get_ticks_msec()
	gameTimeInSeconds = timePassed(Global.startTime,Global.currentTime)
	
func _process(delta: float) -> void:
	Global.daysPassed = gameTimeInSeconds / (30)
	dayCounter(Global.daysPassed)
	changeHeat(Global.heat)
	print(gameTimeInSeconds)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
		
func changeHeat(heat: float) -> void:
	heat_val_label.text = str(int(heat))
	heat_bar.value = heat
	heat_bar.modulate = myGradient.sample(1 * 0.01 * heat)
	#heat_bar.modulate = Color((1 * 0.01 * heat),0,(1 * 0.01 * (100 - heat)),1)

func timePassed(startTime: int, currentTime: int) -> int:
	return ((currentTime - startTime) / 1000)
	
func dayCounter(daysPassed: int) -> void:
	daysPassedLabel.text = "Day " + str(daysPassed)
