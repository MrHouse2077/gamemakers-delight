extends RigidBody2D
class_name Crop

var time_created: float
var season_planted: String
@export var preferred_season: String
var is_ripe = false

func _ready() -> void:
	time_created = Logic.time_sine


func _physics_process(delta: float) -> void:
	if Logic.time_sine - time_created >= .15 or Logic.time_sine - time_created <= -.15 and (Logic.season == "spring" or Logic.season == "fall") :
		is_ripe = true
	elif Logic.time_sine - time_created >= .3 or Logic.time_sine - time_created <= -.3:
		queue_free()
