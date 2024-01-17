class_name PlayerMovement extends Sprite2D

@onready var _playerfollow :PathFollow2D = get_parent()
@onready var player_lap_label = _playerfollow.get_parent().get_parent().get_child(0)
@onready var _enemyfollow = _playerfollow.get_parent().get_parent().get_parent().get_child(2).get_child(0).get_child(0)
@onready var _victory_screen = _playerfollow.get_parent().get_parent().get_parent().get_child(7)
@onready var _victory_screen_scorelabel = _victory_screen.get_child(0).get_child(0).get_child(1)
@onready var _victory_screen_answerlabel = _victory_screen.get_child(0).get_child(0).get_child(2)
@onready var _victory_screen_resultlabel = _victory_screen.get_child(0).get_child(0).get_child(3)

var playerState

var config = ConfigFile.new()
# time steps for GoDot
var time_steps = float(1/120)

# Variables for lap incrementing
var player_lap_counter = 1
var new_player_lap = false 


func _init():
	GlobalScript._set_player_speed()
	pass


func _ready():
	player_lap_label.text = GlobalScript.get_player_lap_label() + str(player_lap_counter) + "/" + str(GlobalScript.max_laps)


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
		player_lap_label.text = GlobalScript.get_player_lap_label() + str(player_lap_counter) + "/" + str(GlobalScript.max_laps)
	
	_check_for_win()
	
	if(_playerfollow.get_progress_ratio() >= 0.9):
		new_player_lap = true 


func _check_for_win():
	if(player_lap_counter == GlobalScript.max_laps and _playerfollow.get_progress_ratio() >= 0.999 and GlobalScript.enemy_finished != true):
		_victory_screen_scorelabel.text = GlobalScript.get_score_label() + str(GlobalScript.player_score)
		_victory_screen_answerlabel.text = GlobalScript.get_correct_answers_string() + str(GlobalScript.correct_answers) + "\n" + GlobalScript.get_incorrect_answers_string() + str(GlobalScript.incorrect_answers)
		_victory_screen_resultlabel.text = GlobalScript.get_victory_string()
		GlobalScript.player_finished = true
		config.load("res://settings3.cfg")
		if GlobalScript.levelCounter == 1:
			config.set_value("Level2R", "noacces", false)
			print(config.get_value("Level2R", "noacces"))
			print(config.get_value("Level3R", "noacces"))
		elif GlobalScript.levelCounter == 2:
			config.set_value("Level3R", "noacces", false)
			print(config.get_value("Level2R", "noacces"))
			print(config.get_value("Level3R", "noacces"))
		config.save("res://settings3.cfg")
		playerState = true
		_victory_screen.set_visible(true)
	elif(GlobalScript.player_finished == false and GlobalScript.enemy_finished == true and 
	_enemyfollow.get_progress_ratio() >= 0.99 and _playerfollow.get_progress_ratio() >= 0.99 and player_lap_counter == GlobalScript.max_laps):
		_victory_screen_scorelabel.text = GlobalScript.get_score_label() + str(GlobalScript.player_score)
		_victory_screen_answerlabel.text = GlobalScript.get_correct_answers_string() + str(GlobalScript.correct_answers) + "\n" + GlobalScript.get_incorrect_answers_string() + str(GlobalScript.incorrect_answers)
		_victory_screen_resultlabel.text = GlobalScript.get_defeat_string()
		playerState = false
		_victory_screen.set_visible(true)

