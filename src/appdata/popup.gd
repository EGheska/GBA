class_name solver extends Popup

@onready var textLabel = $Control/Label
@onready var codetoSolve = $Control/CodeToSolve
@onready var cheetSheet = $Control/CheetSheet
@onready var lineEdit = $Control/LineEdit

const CodeDictionary = {
	"doorCode":2163,
	"2nddoorCode": 6452,
	"3rddoorCode": 5134,
	"4rthdoorCode": 4729,
	"5thdoorCode": 6142,
	"6thdoorCode": 3287,
	"fakedoor1": 4691,
	"fakedoor2":1967,
	"fakedoor3": 9873
}

static var whichDoor
static var doorCounter
static var solved

static func _set_solve(value):
	solved = value

static func __set(property, value):
	whichDoor = property
	doorCounter = value
	
static func __get():
	return whichDoor

func _ready():
	pass
	

func timer_func():
	print("Start")
	await get_tree().create_timer(3).timeout
	print("Timeout")
	self.set_visible(false)
	textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
	lineEdit.clear()

func _on_texture_button_pressed():
	textLabel.set_text("You have to solve the puzzle!\nYou can find a key for decipher the code in the message left for you.\n Use that to so")


func _on_line_edit_text_submitted(new_text):
	match doorCounter:
		1:
			if new_text.to_int() == 2163:
				textLabel.set_text("Congratulations!\nYou have solved the code!")
				_set_solve(true)
				timer_func()	
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
		2:
			if new_text.to_int() == 6452:
				textLabel.set_text("Congratulations!\nYou have solved the code!")
				_set_solve(true)
				timer_func()
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
		3:
			if new_text.to_int() == 5134:
				textLabel.set_text("Congratulations!\nYou have solved the code!")
				_set_solve(true)
				timer_func()
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
		4:
			if new_text.to_int() == 4729:
				textLabel.set_text("Congratulations!\nYou have solved the code!")
				_set_solve(true)
				timer_func()
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
		5:
			if new_text.to_int() == 6142:
				textLabel.set_text("Congratulations!\nYou have solved the code!")
				_set_solve(true)
				timer_func()
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
		6:
			if new_text.to_int() == 3287:
				textLabel.set_text("Congratulations!\nYou have solved the code!")
				_set_solve(true)
				timer_func()
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
		200:
			if new_text.to_int() == 1967:
				textLabel.set_text("Oops! Seems like you've solved the fake door")
				_set_solve(true)
				timer_func()
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
		100:
			if new_text.to_int() == 4691:
				textLabel.set_text("Oops! Seems like you've solved the fake door")
				_set_solve(true)
				timer_func()
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
		300:
			if new_text.to_int() == 9863:
				textLabel.set_text("Oops! Seems like you've solved the fake door")
				_set_solve(true)
				timer_func()
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
		500:
			if new_text.to_int() == 7358:
				textLabel.set_text("Congratulations!\nYou have solved the final code!")
				_set_solve(true)
				await get_tree().create_timer(3).timeout
				self.set_visible(false)
			else:
				textLabel.set_text("The code does not match.\nMaybe, try one more time?")
				
func _on_visibility_changed():
	
	print(whichDoor, doorCounter)
	lineEdit.clear()
	textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
	
	match doorCounter:
		1:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/code1Maz`e.png")
		2:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/code2Maze.PNG")
		3:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/code3Maze.PNG")
		4:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/code4Maze.png")
		5:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/code5Maze.png")
		6:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/code6Maze.png")
		100:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/fakedoor1code.png")
		200:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/fakedoor2code.png")
		300:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/fakedoor3code.png")	
		500:
			codetoSolve.texture = ResourceLoader.load("res://src/appdata/Maze1Final.png")

