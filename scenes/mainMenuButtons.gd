extends Control
@onready var title_btn: Button = %titleBtn
@onready var play_btn: Button = %playBtn
@onready var quit_btn: Button = %quitBtn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_play_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainGame.tscn")
	
func _on_quit_btn_pressed() -> void:
	get_tree().quit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		_on_quit_btn_pressed()
#end func
