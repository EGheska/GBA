extends Node

@onready var config = ConfigFile.new()

var player_speed = 40 #40 (Lagere waarde om de moeilijkheid te kunnen bewaren maar toch genoeg tijd te geven)
const max_laps = 3
var player_score = 0

# Variables for keeping the players scores and amount of correct and incorrect answers
var correct_answers = 0
var incorrect_answers = 0

var enemy_finished = false
var player_finished = false

var victory_string
var defeat_string
var score_label
var player_lap_label
var enemy_lap_label
var correct_answers_string
var incorrect_answers_string

var quit_button_string
var try_again_button_string
var next_level_button_string

var levelCounter = 0
var mazelevelCounter = 0

var correctly_answered_stylebox = preload("res://src/appdata/Correctly_Answered_Math_Button.tres")
var unanswered_stylebox = preload("res://src/appdata/Unanswered_Math_Button.tres")
var incorrectly_answered_stylebox = preload("res://src/appdata/Incorrectly_Answered_Math_Button.tres")

func _reset_global_variables():
	correct_answers = 0
	player_score = 0
	incorrect_answers = 0
	player_finished = false
	enemy_finished = false

func _set_player_speed():
	if levelCounter == 1:
		player_speed = float(50)
	elif levelCounter == 2:
		player_speed = float(50)
	elif levelCounter == 3:
		player_speed = float(40)

func get_victory_string():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		victory_string = "Gewonnen!"
	elif(config.get_value("language", "mode") == "english"):
		victory_string = "Victory!"
	return victory_string

func get_defeat_string():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		defeat_string = "Je hebt hem bijna verslagen!\n Blijf het proberen!"
	elif(config.get_value("language", "mode") == "english"):
		defeat_string = "Almost beat him!\nKeep trying!"
	return defeat_string

func get_score_label():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		score_label = "Uw score: "
	elif(config.get_value("language", "mode") == "english"):
		score_label = "Your score: "
	return score_label

func get_player_lap_label():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		player_lap_label = "Uw ronde: "
	elif(config.get_value("language", "mode") == "english"):
		player_lap_label = "Your lap: "
	return player_lap_label

func get_correct_answers_string():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		correct_answers_string = "Juiste antwoorden: "
	elif(config.get_value("language", "mode") == "english"):
		correct_answers_string = "Correct answers: "
	return correct_answers_string

func get_incorrect_answers_string():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		incorrect_answers_string = "Onjuiste antwoorden: "
	elif(config.get_value("language", "mode") == "english"):
		incorrect_answers_string = "Incorrect answers: "
	return incorrect_answers_string

func get_enemy_lap_string():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		enemy_lap_label = "Tegenstanders ronde: "
	elif(config.get_value("language", "mode") == "english"):
		enemy_lap_label = "Opponents lap: "
	return enemy_lap_label
	
func get_quit_button_string():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		quit_button_string = "Terug naar hoofdmenu"
	elif(config.get_value("language", "mode") == "english"):
		quit_button_string = "Back to main menu"
	return quit_button_string

func get_try_again_button_string():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		try_again_button_string = "Opnieuw proberen"
	elif(config.get_value("language", "mode") == "english"):
		try_again_button_string = "Try again"
	return try_again_button_string

func get_next_level_button_string():
	config.load("res://settings.cfg")
	if(config.get_value("language", "mode") == "dutch"):
		next_level_button_string = "Volgende niveau"
	elif(config.get_value("language", "mode") == "english"):
		next_level_button_string = "Next level"
	return next_level_button_string
