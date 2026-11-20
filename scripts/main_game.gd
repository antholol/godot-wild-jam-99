extends Node2D
@onready var daysPassedLabel: Label = $CanvasLayer/ColorRect/VBoxContainer/daysPassedLabel
@onready var heat_bar: ProgressBar = $"CanvasLayer/Heat Bar"
@onready var heat_val_label: Label = $"CanvasLayer/Heat Bar/heatValLabel"
@onready var cat: Sprite2D = $CanvasLayer/BoxContainer/cat
@onready var timer: Timer = $Timer

@export var myGradient: Gradient

var gameTimeInSeconds: int = 0
var heatUpdated: bool = false # so it only updates once each second instead of every frame in a second...

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.heat = 50.00
	Global.daysPassed = 0
	Global.startTime = Time.get_ticks_msec()
	Global.aggregateHeatLoss = -1
	 
func _physics_process(delta: float) -> void:
	Global.currentTime = Time.get_ticks_msec()
	gameTimeInSeconds = timePassed(Global.startTime,Global.currentTime)
	
	if ((gameTimeInSeconds % 5) == 0) and (not heatUpdated):
		updateHeat()
		heatUpdated = true
		timer.start(1) #starts a timer to change heatUpdated back to false, so this if statement dont run in the same second (once heat *has* been updated)...
	#end if
	
	
func _process(delta: float) -> void:
	Global.daysPassed = gameTimeInSeconds / (320) #therefore each day lasts 16/3 minutes
	dayCounter(Global.daysPassed)
	changeHeatBarVal(Global.heat)
	#print(Global.aggregateHeatLoss)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
		
func changeHeatBarVal(heat: float) -> void:
	heat_val_label.text = str(int(heat))
	heat_bar.value = heat
	heat_bar.modulate = myGradient.sample(1 * 0.01 * heat)
	
	#heat_bar.modulate = Color((1 * 0.01 * heat),0,(1 * 0.01 * (100 - heat)),1)

func timePassed(startTime: int, currentTime: int) -> int:
	return ((currentTime - startTime) / 1000)
	
func dayCounter(daysPassed: int) -> void:
	daysPassedLabel.text = "Day " + str(daysPassed)
	
func _on_timer_timeout() -> void:
	heatUpdated = false
	
func heatCalc(addToHeat: float) -> void: # addToHeat means how much to add i mean ig
	Global.aggregateHeatLoss += addToHeat

func updateHeat() -> void:
	Global.heat = Global.heat + Global.aggregateHeatLoss
	Global.heat = clamp(Global.heat, 0, 100)
	print("Heat Updated!")
	print(gameTimeInSeconds)
