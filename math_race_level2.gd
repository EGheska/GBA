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


var math_dictionary_level2 = {
	"Question 1" : {
		"Equation" : "7*9",
		"Correct Answer" : 63,
		"Answer1" : 65,
		"Answer2" : 63,
		"Answer3" : 56,
		"Answer4" : 61,
		"Score" : 5
	},
	"Question 2" : {
		"Equation" : "12*11",
		"Correct Answer" : 132,
		"Answer1" : 132,
		"Answer2" : 122,
		"Answer3" : 123,
		"Answer4" : 131,
		"Score" : 5
	},
	"Question 3" : {
		"Equation" : "17*4",
		"Correct Answer" : 68,
		"Answer1" : 68,
		"Answer2" : 86,
		"Answer3" : 64,
		"Answer4" : 84,
		"Score" : 5
	},
	"Question 4" : {
		"Equation" : "36/4",
		"Correct Answer" : 9,
		"Answer1" : 8,
		"Answer2" : 7,
		"Answer3" : 9,
		"Answer4" : 6,
		"Score" : 5
	},
	"Question 5" : {
		"Equation" : "121/11",
		"Correct Answer" : 11,
		"Answer1" : 10,
		"Answer2" : 13,
		"Answer3" : 12,
		"Answer4" : 11,
		"Score" : 5
	},
	"Question 6" : {
		"Equation" : "6*7",
		"Correct Answer" : 42,
		"Answer1" : 35,
		"Answer2" : 42,
		"Answer3" : 49,
		"Answer4" : 36,
		"Score" : 5
	},
	"Question 7" : {
		"Equation" : "169/13",
		"Correct Answer" : 13,
		"Answer1" : 12,
		"Answer2" : 15,
		"Answer3" : 13,
		"Answer4" : 17,
		"Score" : 5
	},
	"Question 8" : {
		"Equation" : "5*15",
		"Correct Answer" : 75,
		"Answer1" : 75,
		"Answer2" : 70,
		"Answer3" : 80,
		"Answer4" : 85,
		"Score" : 5
	},
		"Question 9" : {
		"Equation" : "125/5",
		"Correct Answer" :25,
		"Answer1" : 23,
		"Answer2" : 27,
		"Answer3" : 20,
		"Answer4" : 25,
		"Score" : 5
	},
	"Question 10" : {
		"Equation" : "13*6",
		"Correct Answer" : 78,
		"Answer1" : 75,
		"Answer2" : 78,
		"Answer3" : 68,
		"Answer4" : 65,
		"Score" : 5
	},
	"Question 11" : {
		"Equation" : "16*4",
		"Correct Answer" : 64,
		"Answer1" : 46,
		"Answer2" : 62,
		"Answer3" : 42,
		"Answer4" : 64,
		"Score" : 5
	},
	"Question 12" : {
		"Equation" : "17*3",
		"Correct Answer" : 51,
		"Answer1" : 41,
		"Answer2" : 46,
		"Answer3" : 51,
		"Answer4" : 56,
		"Score" : 5
	},
	"Question 13" : {
		"Equation" : "225/25",
		"Correct Answer" : 9,
		"Answer1" : 11,
		"Answer2" : 7,
		"Answer3" : 10,
		"Answer4" : 9,
		"Score" : 5
	},
	"Question 14" : {
		"Equation" : "119/7",
		"Correct Answer" : 17,
		"Answer1" : 17,
		"Answer2" : 16,
		"Answer3" : 14,
		"Answer4" : 15,
		"Score" : 5
	}
}

var level = winOrDefScreen.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalScript.correct_answers = 0
	GlobalScript.player_score = 0
	GlobalScript.incorrect_answers = 0
	GlobalScript.player_finished = false
	GlobalScript.enemy_finished = false
	question_identifier = question_string + str(question_counter)
	question_label.text = math_dictionary_level2[question_identifier]["Equation"]
	current_score_label.text = "Your score: " + str(GlobalScript.player_score)
	button1.text = str(math_dictionary_level2[question_identifier]["Answer1"])
	button2.text = str(math_dictionary_level2[question_identifier]["Answer2"])
	button3.text = str(math_dictionary_level2[question_identifier]["Answer3"])
	button4.text = str(math_dictionary_level2[question_identifier]["Answer4"])
	GlobalScript.levelCounter = 2
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
	question_answer = math_dictionary_level2[question_identifier][answer_identifier]
	if(question_answer == math_dictionary_level2[question_identifier]["Correct Answer"]):
		GlobalScript.player_speed = 150
		$SpeedTimer.start()
		GlobalScript.player_score += math_dictionary_level2[question_identifier]["Score"]
		GlobalScript.correct_answers += 1
		question_counter += 1
		_write_new_question()
	else:
		GlobalScript.incorrect_answers += 1


func _write_new_question():
	question_identifier = question_string + str(question_counter)
	question_label.text = math_dictionary_level2[question_identifier]["Equation"]
	current_score_label.text = "Your score: " + str(GlobalScript.player_score)
	button1.text = str(math_dictionary_level2[question_identifier]["Answer1"])
	button2.text = str(math_dictionary_level2[question_identifier]["Answer2"])
	button3.text = str(math_dictionary_level2[question_identifier]["Answer3"])
	button4.text = str(math_dictionary_level2[question_identifier]["Answer4"])
	
