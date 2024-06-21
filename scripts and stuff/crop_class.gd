extends RigidBody2D
class_name Crop

var time_created: float

func _ready() -> void:
	time_created = Logic.time_sine


func _physics_process(delta: float) -> void:
	if Logic.time_sine - time_created >= .2 or Logic.time_sine - time_created <= -.2:
		queue_free()
