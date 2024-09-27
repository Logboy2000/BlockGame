extends Control

@onready var fps: Label = $VBoxContainer/FPS
@onready var raycast: Label = $VBoxContainer/Raycast
var isRaycastHit = false
func _physics_process(_delta: float) -> void:
	fps.text = "FPS: " + str(Engine.get_frames_per_second())
	raycast.text = "Raycast: " + str(isRaycastHit)
