extends Node

var time_mod = PI/2
var season = "winter"

#debug_only
@onready var season_label = $debug_ui/seasonlabel
@onready var timesine_label = $debug_ui/timesinelabel

@onready var debug_crop = preload("res://scenes and stuff/debug_crop.tscn")


func _ready() -> void:
	Logic.time_sine = sin(time_mod)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("time_fw"):
		time_mod += .005
	
	Logic.time_sine = sin(time_mod)
	
	update_debug()
	season_swap()
	Logic.season = season

func _input(event: InputEvent) -> void:

	if Input.is_action_just_pressed("spawndebugcrop"):
		debug_crop_spawn()

func season_swap():
	if Logic.time_sine >= 0.6:
		season = "winter"
	elif Logic.time_sine <= -0.6:
		season = "summer"
	elif season == "summer" and Logic.time_sine >= -0.6 and Logic.time_sine <= 0.6:
		season = "fall"
	elif season == "winter" and Logic.time_sine >= -0.6 and Logic.time_sine <= 0.6:
		season = "spring"

func update_debug():
	season_label.set_text(season)
	timesine_label.set_text(str(Logic.time_sine))

func debug_crop_spawn():
	var debugcrop = debug_crop.instantiate()
	debugcrop.global_position =  Vector2(100, 100)
	add_child(debugcrop)
