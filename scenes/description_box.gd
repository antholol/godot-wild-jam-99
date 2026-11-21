extends Node2D
@onready var effect_desc: Label = $effectDesc

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = not (Global.layerBeingHoveredOn == null)
	position = get_global_mouse_position()
	if Global.layerBeingHoveredOn:
		effect_desc.text = Global.layerBeingHoveredOn.effectName
