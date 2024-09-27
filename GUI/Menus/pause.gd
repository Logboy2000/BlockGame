extends CanvasLayer

func _physics_process(_delta: float) -> void:
	if visible:
		get_tree().paused = true
	else:
		get_tree().paused = false
	
	if Input.is_action_just_pressed("pause"):
		if visible:
			unpause()
		else:
			pause()
	
	if get_tree().paused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_resume_pressed() -> void:
	unpause()


func pause():
	visible = true
	get_tree().paused = true
	
func unpause():
	visible = false
	get_tree().paused = false

func _on_back_to_title_pressed() -> void:
	unpause()
	get_tree().change_scene_to_file("res://Rooms/title.tscn")
