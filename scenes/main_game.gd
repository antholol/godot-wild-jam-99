extends Node2D
@onready var daysPassedLabel: Label = $CanvasLayer/ColorRect/VBoxContainer/daysPassedLabel
@onready var heat_bar: ProgressBar = $"CanvasLayer/Heat Bar"
@onready var heat_val_label: Label = $"CanvasLayer/Heat Bar/heatValLabel"
@onready var cat: Sprite2D = $CanvasLayer/BoxContainer/cat
@onready var timer: Timer = $timer

@export var myGradient: Gradient

var gameTimeInSeconds: int = 0
var heat_updated:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.heat = 50.00
	Global.daysPassed = 0
	Global.startTime = Time.get_ticks_msec()
	Global.aggregateHeatLoss = -0.25 * 63
	 
func _physics_process(delta: float) -> void:
	Global.currentTime = Time.get_ticks_msec()
	gameTimeInSeconds = timePassed(Global.startTime,Global.currentTime)
	
	if gameTimeInSeconds % 2 == 0 and not heat_updated:
		heat_updated = true
		updateHeat()
		timer.start(1)
		
	
	#end if
	
	
func _process(delta: float) -> void:
	Global.daysPassed = gameTimeInSeconds / (320) #therefore each day lasts 16/3 minutes
	dayCounter(Global.daysPassed)
	changeHeatBarVal(Global.heat)
	#print(gameTimeInSeconds)

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
	
func heatCalc(addToHeat: float) -> void: # addToHeat means how much to add i mean ig
	Global.aggregateHeatLoss += addToHeat

func updateHeat() -> void:
	var updated_heat:float = Global.heat + Global.aggregateHeatLoss
	Global.heat = clamp(updated_heat, 0, 100)
	print("heat updaed")

#func _on_update_heat_timeout() -> void:
	#Global.heat -= 10
	#changeHeatBarVal(Global.heat)
	


func _on_timer_timeout() -> void:
	heat_updated = false
