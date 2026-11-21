class_name Layer
extends Sprite2D
@export var effectName: String = "an effect"

func _on_hover_detection_area_entered(area: Area2D) -> void:
	Global.layerBeingHoveredOn = self # sets to this (root) node
	print("hello!")

func _on_hover_detection_area_exited(area: Area2D) -> void:
	Global.layerBeingHoveredOn = null
