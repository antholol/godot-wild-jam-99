class_name Layer
extends Sprite2D
@export var effectName: String = "an effect"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_hover_detection_mouse_entered() -> void:
	Global.layerBeingHoveredOn = self # sets to this (root) node
	print("hello!")

func _on_hover_detection_mouse_exited() -> void:
	Global.layerBeingHoveredOn = null
