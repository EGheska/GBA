class_name PlayerMovement extends Sprite2D


@onready var _playerfollow :PathFollow2D = get_parent()
@onready var player_lap_label = _playerfollow.get_parent().get_parent().get_child(0)
@onready var _enemyfollow = _playerfollow.get_parent().get_parent().get_parent().get_child(2).get_child(0).get_child(0)
@onready var _victory_screen = _playerfollow.get_parent().get_parent().get_parent().get_child(7)
@onready var _victory_screen_scorelabel = _victory_screen.get_child(0).get_child(0).get_child(1)
@onready var _victory_screen_answerlabel = _victory_screen.get_child(0).get_child(0).get_child(2)
@onready var _victory_screen_resultlabel = _victory_screen.get_child(0).get_child(0).get_child(3)

var playerState

# time steps for GoDot
var time_steps = float(1/120)

# Variables for lap incrementing
var player_lap_counter = 1
var new_player_lap = false 

# Score and answer strings for label
var score_string = "Your score: "
var correct_answers_string = "Amount of correct answers: "
var incorrect_answers_string = "Amount of incorrect answers: "




func _init():
	pass


func _ready():
	player_lap_label.text = "Your Lap: " + str(player_lap_counter) + "/" + str(GlobalScript.max_laps)
	_physics_process(time_steps)


func _physics_process(delta):
	_playerfollow.set_progress(_playerfollow.get_progress() + GlobalScript.player_speed * delta)
	_increment_player_lap_counter()


func _increment_player_lap_counter():
	# Increments lap counter
	if(_playerfollow.get_progress_ratio() <= 0.05 and new_player_lap == true):
		player_lap_counter += 1
		new_player_lap = false
		# sets looping to false after final lap has been reached
		if(player_lap_counter >= GlobalScript.max_laps):
			_playerfollow.set_loop(false)
		player_lap_label.text = "Your Lap: " + str(player_lap_counter) + "/" + str(GlobalScript.max_laps)
	
	_check_for_win()
	
	if(_playerfollow.get_progress_ratio() >= 0.9):
		new_player_lap = true 


func _check_for_win():
	if(player_lap_counter == GlobalScript.max_laps and _playerfollow.get_progress_ratio() >= 0.999 and GlobalScript.enemy_finished != true):
		_victory_screen_scorelabel.text = score_string + str(GlobalScript.player_score)
		_victory_screen_answerlabel.text = correct_answers_string + str(GlobalScript.correct_answers) + "\n" + incorrect_answers_string + str(GlobalScript.incorrect_answers)
		_victory_screen_resultlabel.text = GlobalScript.victory_string
		GlobalScript.player_finished = true
		playerState = true
		_victory_screen.set_visible(true)
	elif(GlobalScript.player_finished == false and GlobalScript.enemy_finished == true and 
	_enemyfollow.get_progress_ratio() >= 0.99 and _playerfollow.get_progress_ratio() >= 0.99 and player_lap_counter == GlobalScript.max_laps):
		_victory_screen_scorelabel.text = score_string + str(GlobalScript.player_score)
		_victory_screen_answerlabel.text = correct_answers_string + str(GlobalScript.correct_answers) + "\n" + incorrect_answers_string + str(GlobalScript.incorrect_answers)
		_victory_screen_resultlabel.text = GlobalScript.defeat_string
		playerState = false
		_victory_screen.set_visible(true)


func _on_speed_timer_timeout():
	GlobalScript.player_speed = 105
	pass # Replace with function body.

