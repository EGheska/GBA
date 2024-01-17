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


var math_dictionary_level2 = {
	"Question 1" : {
		"Equation" : "7*9",
		"Correct Answer" : 63,
		"Answer1" : 65,
		"Answer2" : 63,
		"Answer3" : 56,
		"Answer4" : 61,
		"Score" : 50
	},
	"Question 2" : {
		"Equation" : "12*11",
		"Correct Answer" : 132,
		"Answer1" : 132,
		"Answer2" : 122,
		"Answer3" : 123,
		"Answer4" : 131,
		"Score" : 50
	},
	"Question 3" : {
		"Equation" : "17*4",
		"Correct Answer" : 68,
		"Answer1" : 68,
		"Answer2" : 86,
		"Answer3" : 64,
		"Answer4" : 84,
		"Score" : 50
	},
	"Question 4" : {
		"Equation" : "36/4",
		"Correct Answer" : 9,
		"Answer1" : 8,
		"Answer2" : 7,
		"Answer3" : 9,
		"Answer4" : 6,
		"Score" : 50
	},
	"Question 5" : {
		"Equation" : "121/11",
		"Correct Answer" : 11,
		"Answer1" : 10,
		"Answer2" : 13,
		"Answer3" : 12,
		"Answer4" : 11,
		"Score" : 50
	},
	"Question 6" : {
		"Equation" : "6*7",
		"Correct Answer" : 42,
		"Answer1" : 35,
		"Answer2" : 42,
		"Answer3" : 49,
		"Answer4" : 36,
		"Score" : 50
	},
	"Question 7" : {
		"Equation" : "169/13",
		"Correct Answer" : 13,
		"Answer1" : 12,
		"Answer2" : 15,
		"Answer3" : 13,
		"Answer4" : 17,
		"Score" : 50
	},
	"Question 8" : {
		"Equation" : "5*15",
		"Correct Answer" : 75,
		"Answer1" : 75,
		"Answer2" : 70,
		"Answer3" : 80,
		"Answer4" : 85,
		"Score" : 50
	},
		"Question 9" : {
		"Equation" : "125/5",
		"Correct Answer" :25,
		"Answer1" : 23,
		"Answer2" : 27,
		"Answer3" : 20,
		"Answer4" : 25,
		"Score" : 50
	},
	"Question 10" : {
		"Equation" : "13*6",
		"Correct Answer" : 78,
		"Answer1" : 75,
		"Answer2" : 78,
		"Answer3" : 68,
		"Answer4" : 65,
		"Score" : 50
	},
	"Question 11" : {
		"Equation" : "16*4",
		"Correct Answer" : 64,
		"Answer1" : 46,
		"Answer2" : 62,
		"Answer3" : 42,
		"Answer4" : 64,
		"Score" : 50
	},
	"Question 12" : {
		"Equation" : "17*3",
		"Correct Answer" : 51,
		"Answer1" : 41,
		"Answer2" : 46,
		"Answer3" : 51,
		"Answer4" : 56,
		"Score" : 50
	},
	"Question 13" : {
		"Equation" : "225/25",
		"Correct Answer" : 9,
		"Answer1" : 11,
		"Answer2" : 7,
		"Answer3" : 10,
		"Answer4" : 9,
		"Score" : 50
	},
	"Question 14" : {
		"Equation" : "119/7",
		"Correct Answer" : 17,
		"Answer1" : 17,
		"Answer2" : 16,
		"Answer3" : 14,
		"Answer4" : 15,
		"Score" : 50
	},
	"Question 15" : {
		"Equation" : "7*15",
		"Correct Answer" : 105,
		"Answer1" : 115,
		"Answer2" : 105,
		"Answer3" : 75,
		"Answer4" : 95,
		"Score" : 50
	},
	"Question 16" : {
		"Equation" : "19*3",
		"Correct Answer" : 57,
		"Answer1" : 75,
		"Answer2" : 47,
		"Answer3" : 57,
		"Answer4" : 65,
		"Score" : 50
	},
	"Question 17" : {
		"Equation" : "24/3",
		"Correct Answer" : 8,
		"Answer1" : 9,
		"Answer2" : 8,
		"Answer3" : 7,
		"Answer4" : 6,
		"Score" : 25
	},
	"Question 18" : {
		"Equation" : "13*11",
		"Correct Answer" : 143,
		"Answer1" : 146,
		"Answer2" : 143,
		"Answer3" : 134,
		"Answer4" : 136,
		"Score" : 50
	},
	"Question 19" : {
		"Equation" : "19*5",
		"Correct Answer" : 95,
		"Answer1" : 95,
		"Answer2" : 97,
		"Answer3" : 90,
		"Answer4" : 92,
		"Score" : 50
	},
	"Question 20" : {
		"Equation" : "23*4",
		"Correct Answer" : 92,
		"Answer1" : 98,
		"Answer2" : 102,
		"Answer3" : 96,
		"Answer4" : 92,
		"Score" : 50
	},
	"Question 21" : {
		"Equation" : "33*3",
		"Correct Answer" : 99,
		"Answer1" : 89,
		"Answer2" : 93,
		"Answer3" : 99,
		"Answer4" : 102,
		"Score" : 50
	},
	"Question 22" : {
		"Equation" : "9*15",
		"Correct Answer" : 135,
		"Answer1" : 135,
		"Answer2" : 140,
		"Answer3" : 125,
		"Answer4" : 130,
		"Score" : 50
	},
		"Question 23" : {
		"Equation" : "27*4",
		"Correct Answer" : 108,
		"Answer1" : 103,
		"Answer2" : 108,
		"Answer3" : 98,
		"Answer4" : 113,
		"Score" : 50
	},
	"Question 24" : {
		"Equation" : "35*4",
		"Correct Answer" : 140,
		"Answer1" : 145,
		"Answer2" : 135,
		"Answer3" : 140,
		"Answer4" : 130,
		"Score" : 50
	},
	"Question 25" : {
		"Equation" : "147/7",
		"Correct Answer" : 21,
		"Answer1" : 23,
		"Answer2" : 22,
		"Answer3" : 19,
		"Answer4" : 21,
		"Score" : 50
	},
	"Question 26" : {
		"Equation" : "117/9",
		"Correct Answer" : 13,
		"Answer1" : 13,
		"Answer2" : 15,
		"Answer3" : 14,
		"Answer4" : 12,
		"Score" : 50
	},
	"Question 27" : {
		"Equation" : "162/6",
		"Correct Answer" : 27,
		"Answer1" : 26,
		"Answer2" : 27,
		"Answer3" : 29,
		"Answer4" : 24,
		"Score" : 50
	},
	"Question 28" : {
		"Equation" : "192/16",
		"Correct Answer" : 12,
		"Answer1" : 15,
		"Answer2" : 13,
		"Answer3" : 12,
		"Answer4" : 11,
		"Score" : 50
	},
	"Question 29" : {
		"Equation" : "319/11",
		"Correct Answer" : 29,
		"Answer1" : 28,
		"Answer2" : 31,
		"Answer3" : 30,
		"Answer4" : 29,
		"Score" : 50
	},
	"Question 30" : {
		"Equation" : "207/23",
		"Correct Answer" : 9,
		"Answer1" : 9,
		"Answer2" : 11,
		"Answer3" : 8,
		"Answer4" : 10,
		"Score" : 50
	}
}

var number_of_questions = math_dictionary_level2.size()

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalScript._reset_global_variables()
	GlobalScript._set_player_speed()
	_write_player_score()
	_set_button_fontsizes()
	_write_new_question()
	GlobalScript.levelCounter = 2
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
	question_answer = math_dictionary_level2[question_identifier][answer_identifier]
	
	if(question_answer == math_dictionary_level2[question_identifier]["Correct Answer"]):
		GlobalScript.player_speed = 80
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

func _score_calculation_algorithm():
	var time_weight = 0.6
	return round(time_weight * $Question_timer.get_time_left() * math_dictionary_level2[question_identifier]["Score"])

func _write_new_question():
	var previous_question_counter = question_counter
	while(previous_question_counter == question_counter):
		question_counter = randi_range(1, number_of_questions)
	
	_reset_button_color()
	
	question_identifier = question_string + str(question_counter)
	question_label.text = math_dictionary_level2[question_identifier]["Equation"]
	button1.text = str(math_dictionary_level2[question_identifier]["Answer1"])
	button2.text = str(math_dictionary_level2[question_identifier]["Answer2"])
	button3.text = str(math_dictionary_level2[question_identifier]["Answer3"])
	button4.text = str(math_dictionary_level2[question_identifier]["Answer4"])
	$Question_timer.start()

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

