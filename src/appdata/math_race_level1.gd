extends CanvasLayer

@onready var button1 = $Math_Answer/GridContainer/Button
@onready var button2 = $Math_Answer/GridContainer/Button2
@onready var button3 = $Math_Answer/GridContainer/Button3
@onready var button4 = $Math_Answer/GridContainer/Button4
@onready var question_label = $Math_question/Label
@onready var player_movement_script = $Player/Player_path/PathFollow2D/Player_car
@onready var current_score_label = $"Score_Label Control/Current_Score Label"




# Variables to identify questions and answers in dictionary
var question_string = "Question "
var answer_string = "Answer"
var question_identifier
var answer_identifier
var question_counter = 1



# Variable for checking the answer the player gave with the one in the dictionary
var question_answer


# Used to check answer based on pressed button
var button1_pressed = false
var button2_pressed = false
var button3_pressed = false
var button4_pressed = false


var math_dictionary_level1 = {
	"Question 1" : {
		"Equation" : "27+91",
		"Correct Answer" : 118,
		"Answer1" : 118,
		"Answer2" : 108,
		"Answer3" : 116,
		"Answer4" : 126,
		"Score" : 5
	},
	"Question 2" : {
		"Equation" : "133-37",
		"Correct Answer" : 96,
		"Answer1" : 94,
		"Answer2" : 106,
		"Answer3" : 96,
		"Answer4" : 104,
		"Score" : 5
	},
	"Question 3" : {
		"Equation" : "115-28",
		"Correct Answer" : 87,
		"Answer1" : 97,
		"Answer2" : 93,
		"Answer3" : 103,
		"Answer4" : 87,
		"Score" : 5
	},
	"Question 4" : {
		"Equation" : "177+22",
		"Correct Answer" : 199,
		"Answer1" : 201,
		"Answer2" : 209,
		"Answer3" : 199,
		"Answer4" : 205,
		"Score" : 5
	},
	"Question 5" : {
		"Equation" : "115+88",
		"Correct Answer" : 203,
		"Answer1" : 198,
		"Answer2" : 193,
		"Answer3" : 203,
		"Answer4" : 205,
		"Score" : 5
	},
	"Question 6" : {
		"Equation" : "53+72",
		"Correct Answer" : 125,
		"Answer1" : 115,
		"Answer2" : 125,
		"Answer3" : 118,
		"Answer4" : 121,
		"Score" : 5
	},
	"Question 7" : {
		"Equation" : "125-28",
		"Correct Answer" : 97,
		"Answer1" : 93,
		"Answer2" : 97,
		"Answer3" : 103,
		"Answer4" : 107,
		"Score" : 5
	},
	"Question 8" : {
		"Equation" : "24+136",
		"Correct Answer" : 160,
		"Answer1" : 150,
		"Answer2" : 160,
		"Answer3" : 158,
		"Answer4" : 162,
		"Score" : 5
	},
		"Question 9" : {
		"Equation" : "113-37",
		"Correct Answer" : 76,
		"Answer1" : 86,
		"Answer2" : 84,
		"Answer3" : 76,
		"Answer4" : 74,
		"Score" : 5
	},
	"Question 10" : {
		"Equation" : "134-26",
		"Correct Answer" : 108,
		"Answer1" : 112,
		"Answer2" : 118,
		"Answer3" : 108,
		"Answer4" : 102,
		"Score" : 5
	},
	"Question 11" : {
		"Equation" : "113+28",
		"Correct Answer" : 141,
		"Answer1" : 141,
		"Answer2" : 139,
		"Answer3" : 149,
		"Answer4" : 131,
		"Score" : 5
	},
	"Question 12" : {
		"Equation" : "216-209",
		"Correct Answer" : 7,
		"Answer1" : 3,
		"Answer2" : 13,
		"Answer3" : 17,
		"Answer4" : 7,
		"Score" : 5
	},
	"Question 13" : {
		"Equation" : "33+81",
		"Correct Answer" : 114,
		"Answer1" : 106,
		"Answer2" : 104,
		"Answer3" : 116,
		"Answer4" : 114,
		"Score" : 5
	},
	"Question 14" : {
		"Equation" : "304-147",
		"Correct Answer" : 157,
		"Answer1" : 167,
		"Answer2" : 175,
		"Answer3" : 157,
		"Answer4" : 165,
		"Score" : 5
	}
}

var levelClass = winOrDefScreen.new() 
# Called when the node enters te scene tree for the first time.
func _ready():
	GlobalScript.correct_answers = 0
	GlobalScript.player_score = 0
	GlobalScript.incorrect_answers = 0
	GlobalScript.player_finished = false
	GlobalScript.enemy_finished = false
	question_identifier = question_string + str(question_counter)
	question_label.text = math_dictionary_level1[question_identifier]["Equation"]
	current_score_label.text = "Your score: " + str(GlobalScript.player_score) 
	button1.text = str(math_dictionary_level1[question_identifier]["Answer1"])
	button2.text = str(math_dictionary_level1[question_identifier]["Answer2"])
	button3.text = str(math_dictionary_level1[question_identifier]["Answer3"])
	button4.text = str(math_dictionary_level1[question_identifier]["Answer4"])
	GlobalScript.levelCounter = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	check_answer(1)
	pass


func _on_button_2_pressed():
	check_answer(2)
	pass # Replace with function body.


func _on_button_3_pressed():
	check_answer(3)
	pass # Replace with function body.


func _on_button_4_pressed():
	check_answer(4)
	pass # Replace with function body.


func check_answer(answer_number):
	answer_identifier = answer_string + str(answer_number)
	question_answer = math_dictionary_level1[question_identifier][answer_identifier]
	if(question_answer == math_dictionary_level1[question_identifier]["Correct Answer"]):
		print("Correct answer, mah man!")
		$SpeedTimer.start()
		GlobalScript.player_score += math_dictionary_level1[question_identifier]["Score"]
		question_counter += 1
		_write_new_question()
		GlobalScript.player_speed = 150
		GlobalScript.correct_answers += 1

	else:
		print("Incorrect answer, mah man!")
		GlobalScript.incorrect_answers += 1


func _write_new_question():
	current_score_label.text = "Your score: " + str(GlobalScript.player_score) 
	question_identifier = question_string + str(question_counter)
	question_label.text = math_dictionary_level1[question_identifier]["Equation"]
	button1.text = str(math_dictionary_level1[question_identifier]["Answer1"])
	button2.text = str(math_dictionary_level1[question_identifier]["Answer2"])
	button3.text = str(math_dictionary_level1[question_identifier]["Answer3"])
	button4.text = str(math_dictionary_level1[question_identifier]["Answer4"])


func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/math_race_level2.tscn")
	pass # Replace with function body.
