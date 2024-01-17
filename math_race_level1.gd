extends CanvasLayer

@onready var button1 = $Math_Answer/GridContainer/Button
@onready var button2 = $Math_Answer/GridContainer/Button2
@onready var button3 = $Math_Answer/GridContainer/Button3
@onready var button4 = $Math_Answer/GridContainer/Button4
@onready var question_label = $Math_question/Label
@onready var player_movement_script = $Player/Player_path/PathFollow2D/Player_car
@onready var current_score_label = $"Score_Label Control/Current_Score Label"
@onready var mistake_timer = $Mistake_Timer

# Variables to identify questions and answers in dictionary
var question_string = "Question "
var answer_string = "Answer"
var question_identifier
var answer_identifier
var question_counter


# Variable for checking the answer the player gave with the one in the dictionary
var question_answer


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
	},
	"Question 15" : {
		"Equation" : "216-88",
		"Correct Answer" : 128,
		"Answer1" : 113,
		"Answer2" : 118,
		"Answer3" : 123,
		"Answer4" : 128,
		"Score" : 5
	},
	"Question 16" : {
		"Equation" : "127+84",
		"Correct Answer" : 211,
		"Answer1" : 211,
		"Answer2" : 201,
		"Answer3" : 206,
		"Answer4" : 216,
		"Score" : 5
	},
	"Question 17" : {
		"Equation" : "113-36",
		"Correct Answer" : 77,
		"Answer1" : 87,
		"Answer2" : 77,
		"Answer3" : 83,
		"Answer4" : 73,
		"Score" : 5
	},
	"Question 18" : {
		"Equation" : "71+44",
		"Correct Answer" : 115,
		"Answer1" : 117,
		"Answer2" : 107,
		"Answer3" : 115,
		"Answer4" : 105,
		"Score" : 5
	},
	"Question 19" : {
		"Equation" : "312-127",
		"Correct Answer" : 185,
		"Answer1" : 190,
		"Answer2" : 195,
		"Answer3" : 180,
		"Answer4" : 185,
		"Score" : 5
	},
	"Question 20" : {
		"Equation" : "37+19",
		"Correct Answer" : 56,
		"Answer1" : 56,
		"Answer2" : 65,
		"Answer3" : 58,
		"Answer4" : 46,
		"Score" : 5
	},
	"Question 21" : {
		"Equation" : "121-27",
		"Correct Answer" : 94,
		"Answer1" : 96,
		"Answer2" : 94,
		"Answer3" : 104,
		"Answer4" : 106,
		"Score" : 5
	},
	"Question 22" : {
		"Equation" : "126+37",
		"Correct Answer" : 163,
		"Answer1" : 158,
		"Answer2" : 153,
		"Answer3" : 163,
		"Answer4" : 160,
		"Score" : 5
	},
	"Question 23" : {
		"Equation" : "326-238",
		"Correct Answer" : 88,
		"Answer1" : 92,
		"Answer2" : 82,
		"Answer3" : 98,
		"Answer4" : 88,
		"Score" : 5
	},
	"Question 24" : {
		"Equation" : "63+71",
		"Correct Answer" : 134,
		"Answer1" : 134,
		"Answer2" : 124,
		"Answer3" : 132,
		"Answer4" : 122,
		"Score" : 5
	},
	"Question 25" : {
		"Equation" : "72-59",
		"Correct Answer" : 13,
		"Answer1" : 27,
		"Answer2" : 13,
		"Answer3" : 17,
		"Answer4" : 23,
		"Score" : 5
	},
	"Question 26" : {
		"Equation" : "93+136",
		"Correct Answer" : 229,
		"Answer1" : 219,
		"Answer2" : 222,
		"Answer3" : 229,
		"Answer4" : 226,
		"Score" : 5
	},
	"Question 27" : {
		"Equation" : "157-89",
		"Correct Answer" : 68,
		"Answer1" : 72,
		"Answer2" : 73,
		"Answer3" : 78,
		"Answer4" : 68,
		"Score" : 5
	},
	"Question 28" : {
		"Equation" : "97+112",
		"Correct Answer" : 209,
		"Answer1" : 209,
		"Answer2" : 199,
		"Answer3" : 214,
		"Answer4" : 204,
		"Score" : 5
	},
	"Question 29" : {
		"Equation" : "160-38",
		"Correct Answer" : 122,
		"Answer1" : 128,
		"Answer2" : 122,
		"Answer3" : 132,
		"Answer4" : 138,
		"Score" : 5
	},
	"Question 30" : {
		"Equation" : "73+88",
		"Correct Answer" : 161,
		"Answer1" : 171,
		"Answer2" : 177,
		"Answer3" : 161,
		"Answer4" : 167,
		"Score" : 5
	}
}

var number_of_questions = math_dictionary_level1.size()

# Called when the node enters te scene tree for the first time.
func _ready():
	GlobalScript._reset_global_variables()
	GlobalScript._set_player_speed()
	_write_player_score()
	_set_button_fontsizes()
	_write_new_question()
	GlobalScript.levelCounter = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_flash_answer_buttons()
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
		GlobalScript.player_speed = 70
		$SpeedTimer.start()
		$Correct_Answer_Timer.start()
		match(answer_number):
			1:
				button1.add_theme_stylebox_override("hover", GlobalScript.correctly_answered_stylebox)
				button1.add_theme_stylebox_override("focus", GlobalScript.correctly_answered_stylebox)
				button1.add_theme_stylebox_override("normal", GlobalScript.correctly_answered_stylebox)
			2:
				button2.add_theme_stylebox_override("hover", GlobalScript.correctly_answered_stylebox)
				button2.add_theme_stylebox_override("focus", GlobalScript.correctly_answered_stylebox)
				button2.add_theme_stylebox_override("normal", GlobalScript.correctly_answered_stylebox)
			3:
				button3.add_theme_stylebox_override("hover", GlobalScript.correctly_answered_stylebox)
				button3.add_theme_stylebox_override("focus", GlobalScript.correctly_answered_stylebox)
				button3.add_theme_stylebox_override("normal", GlobalScript.correctly_answered_stylebox)
			4:
				button4.add_theme_stylebox_override("hover", GlobalScript.correctly_answered_stylebox)
				button4.add_theme_stylebox_override("focus", GlobalScript.correctly_answered_stylebox)
				button4.add_theme_stylebox_override("normal", GlobalScript.correctly_answered_stylebox)
	else:
		match(answer_number):
			1:
				button1.add_theme_stylebox_override("hover", GlobalScript.incorrectly_answered_stylebox)
				button1.add_theme_stylebox_override("focus", GlobalScript.incorrectly_answered_stylebox)
				button1.add_theme_stylebox_override("normal", GlobalScript.incorrectly_answered_stylebox)
				if(mistake_timer.is_stopped() == true):
					mistake_timer.start()
			2:
				button2.add_theme_stylebox_override("hover", GlobalScript.incorrectly_answered_stylebox)
				button2.add_theme_stylebox_override("focus", GlobalScript.incorrectly_answered_stylebox)
				button2.add_theme_stylebox_override("normal", GlobalScript.incorrectly_answered_stylebox)
				if(mistake_timer.is_stopped() == true):
					mistake_timer.start()
			3:
				button3.add_theme_stylebox_override("hover", GlobalScript.incorrectly_answered_stylebox)
				button3.add_theme_stylebox_override("focus", GlobalScript.incorrectly_answered_stylebox)
				button3.add_theme_stylebox_override("normal", GlobalScript.incorrectly_answered_stylebox)
				if(mistake_timer.is_stopped() == true):
					mistake_timer.start()
			4:
				button4.add_theme_stylebox_override("hover", GlobalScript.incorrectly_answered_stylebox)
				button4.add_theme_stylebox_override("focus", GlobalScript.incorrectly_answered_stylebox)
				button4.add_theme_stylebox_override("normal", GlobalScript.incorrectly_answered_stylebox)
				if(mistake_timer.is_stopped() == true):
					mistake_timer.start()
		GlobalScript.incorrect_answers += 1
		GlobalScript.player_score -= 50
		_write_player_score()

func _set_button_fontsizes():
	button1.add_theme_font_size_override("font_size", 50)
	button2.add_theme_font_size_override("font_size", 50)
	button3.add_theme_font_size_override("font_size", 50)
	button4.add_theme_font_size_override("font_size", 50)

func _write_new_question():
	var previous_question_counter = question_counter
	while(previous_question_counter == question_counter):
		question_counter = randi_range(1, number_of_questions)
		
	_reset_button_color()
	
	question_identifier = question_string + str(question_counter)
	question_label.text = math_dictionary_level1[question_identifier]["Equation"]
	button1.text = str(math_dictionary_level1[question_identifier]["Answer1"])
	button2.text = str(math_dictionary_level1[question_identifier]["Answer2"])
	button3.text = str(math_dictionary_level1[question_identifier]["Answer3"])
	button4.text = str(math_dictionary_level1[question_identifier]["Answer4"])
	$Question_timer.start()

func _score_calculation_algorithm():
	var time_weight = 0.6
	return round(time_weight * $Question_timer.get_time_left() * math_dictionary_level1[question_identifier]["Score"])

func _write_player_score():
	current_score_label.text = GlobalScript.get_score_label() + str(GlobalScript.player_score) 

func _on_mistake_timer_timeout():
	_reset_button_color()

func _reset_button_color():
	# Resets button texture to unanswered style
	button1.add_theme_stylebox_override("hover", GlobalScript.unanswered_stylebox)
	button1.add_theme_stylebox_override("focus", GlobalScript.unanswered_stylebox)
	button1.add_theme_stylebox_override("normal", GlobalScript.unanswered_stylebox)
	button2.add_theme_stylebox_override("hover", GlobalScript.unanswered_stylebox)
	button2.add_theme_stylebox_override("focus", GlobalScript.unanswered_stylebox)
	button2.add_theme_stylebox_override("normal", GlobalScript.unanswered_stylebox)
	button3.add_theme_stylebox_override("hover", GlobalScript.unanswered_stylebox)
	button3.add_theme_stylebox_override("focus", GlobalScript.unanswered_stylebox)
	button3.add_theme_stylebox_override("normal", GlobalScript.unanswered_stylebox)
	button4.add_theme_stylebox_override("hover", GlobalScript.unanswered_stylebox)
	button4.add_theme_stylebox_override("focus", GlobalScript.unanswered_stylebox)
	button4.add_theme_stylebox_override("normal", GlobalScript.unanswered_stylebox)
	
	# Resets button font colors
	button1.add_theme_color_override("font_color", Color.WHITE)
	button2.add_theme_color_override("font_color", Color.WHITE)
	button3.add_theme_color_override("font_color", Color.WHITE)
	button4.add_theme_color_override("font_color", Color.WHITE)
	button1.add_theme_color_override("font_hover_color", Color.WHITE)
	button2.add_theme_color_override("font_hover_color", Color.WHITE)
	button3.add_theme_color_override("font_hover_color", Color.WHITE)
	button4.add_theme_color_override("font_hover_color", Color.WHITE)
	button1.add_theme_color_override("font_focus_color", Color.WHITE)
	button2.add_theme_color_override("font_focus_color", Color.WHITE)
	button3.add_theme_color_override("font_focus_color", Color.WHITE)
	button4.add_theme_color_override("font_focus_color", Color.WHITE)


func _on_question_timer_timeout():
	button1.add_theme_color_override("font_color", Color.WHITE)
	button2.add_theme_color_override("font_color", Color.WHITE)
	button3.add_theme_color_override("font_color", Color.WHITE)
	button4.add_theme_color_override("font_color", Color.WHITE)
	button1.add_theme_color_override("font_hover_color", Color.WHITE)
	button2.add_theme_color_override("font_hover_color", Color.WHITE)
	button3.add_theme_color_override("font_hover_color", Color.WHITE)
	button4.add_theme_color_override("font_hover_color", Color.WHITE)
	button1.add_theme_color_override("font_focus_color", Color.WHITE)
	button2.add_theme_color_override("font_focus_color", Color.WHITE)
	button3.add_theme_color_override("font_focus_color", Color.WHITE)
	button4.add_theme_color_override("font_focus_color", Color.WHITE)
	_write_new_question()

func _flash_answer_buttons():
	if($Question_timer.get_time_left() <= 2 and $Question_timer.get_time_left() > 1):
		if(button1.get_theme_color("font_color") != Color.CRIMSON):
			button1.add_theme_color_override("font_color", Color.ORANGE)
			button1.add_theme_color_override("font_hover_color", Color.ORANGE)
			button1.add_theme_color_override("font_focus_color", Color.ORANGE)
		if(button2.get_theme_color("font_color") != Color.CRIMSON):
			button2.add_theme_color_override("font_color", Color.ORANGE)
			button2.add_theme_color_override("font_hover_color", Color.ORANGE)
			button2.add_theme_color_override("font_focus_color", Color.ORANGE)
		if(button3.get_theme_color("font_color") != Color.CRIMSON):
			button3.add_theme_color_override("font_color", Color.ORANGE)
			button3.add_theme_color_override("font_hover_color", Color.ORANGE)
			button3.add_theme_color_override("font_focus_color", Color.ORANGE)
		if(button4.get_theme_color("font_color") != Color.CRIMSON):
			button4.add_theme_color_override("font_color", Color.ORANGE)
			button4.add_theme_color_override("font_hover_color", Color.ORANGE)
			button4.add_theme_color_override("font_focus_color", Color.ORANGE)
	elif($Question_timer.get_time_left() <= 1 and $Question_timer.get_time_left() > 0.5):
		if(button1.get_theme_color("font_color") != Color.CRIMSON):
			button1.add_theme_color_override("font_color", Color.DARK_ORANGE)
			button1.add_theme_color_override("font_hover_color", Color.DARK_ORANGE)
			button1.add_theme_color_override("font_focus_color", Color.DARK_ORANGE)
		if(button2.get_theme_color("font_color") != Color.CRIMSON):
			button2.add_theme_color_override("font_color", Color.DARK_ORANGE)
			button2.add_theme_color_override("font_hover_color", Color.DARK_ORANGE)
			button2.add_theme_color_override("font_focus_color", Color.DARK_ORANGE)
		if(button3.get_theme_color("font_color") != Color.CRIMSON):
			button3.add_theme_color_override("font_color", Color.DARK_ORANGE)
			button3.add_theme_color_override("font_hover_color", Color.DARK_ORANGE)
			button3.add_theme_color_override("font_focus_color", Color.DARK_ORANGE)
		if(button4.get_theme_color("font_color") != Color.CRIMSON):
			button4.add_theme_color_override("font_color", Color.DARK_ORANGE)
			button4.add_theme_color_override("font_hover_color", Color.DARK_ORANGE)
			button4.add_theme_color_override("font_focus_color", Color.DARK_ORANGE)
	elif($Question_timer.get_time_left() <= 0.5):
		if(button1.get_theme_color("font_color") != Color.CRIMSON):
			button1.add_theme_color_override("font_color", Color.ORANGE_RED)
			button1.add_theme_color_override("font_hover_color", Color.ORANGE_RED)
			button1.add_theme_color_override("font_focus_color", Color.ORANGE_RED)
		if(button2.get_theme_color("font_color") != Color.CRIMSON):
			button2.add_theme_color_override("font_color", Color.ORANGE_RED)
			button2.add_theme_color_override("font_hover_color", Color.ORANGE_RED)
			button2.add_theme_color_override("font_focus_color", Color.ORANGE_RED)
		if(button3.get_theme_color("font_color") != Color.CRIMSON):
			button3.add_theme_color_override("font_color", Color.ORANGE_RED)
			button3.add_theme_color_override("font_hover_color", Color.ORANGE_RED)
			button3.add_theme_color_override("font_focus_color", Color.ORANGE_RED)
		if(button4.get_theme_color("font_color") != Color.CRIMSON):
			button4.add_theme_color_override("font_color", Color.ORANGE_RED)
			button4.add_theme_color_override("font_hover_color", Color.ORANGE_RED)
			button4.add_theme_color_override("font_focus_color", Color.ORANGE_RED)


func _on_correct_answer_timer_timeout():
	GlobalScript.player_score += _score_calculation_algorithm()
	_write_new_question()
	GlobalScript.correct_answers += 1
	_write_player_score()
	_reset_button_color()
	pass # Replace with function body.


func _on_speed_timer_timeout():
	GlobalScript._set_player_speed()
	pass # Replace with function body.
