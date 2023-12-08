class_name solver extends Popup

@onready var textLabel = $Control/Label
@onready var codetoSolve = $Control/CodeToSolve
@onready var cheetSheet = $Control/CheetSheet
@onready var lineEdit = $Control/LineEdit


const firstCode = "2163"
const secondCode = "6452"

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

func _on_texture_button_pressed():
	textLabel.set_text("You have to solve the puzzle!\n You can find a key for decipher the code in the message left for you.\n Use that to so")


func _on_line_edit_text_submitted(new_text):
	if new_text == firstCode: # if new_text == dictionary(doorCounter)
		var t = Timer.new()
		textLabel.set_text("Congratulations!\n You have solved the first code!")
		_set_solve(true)
		#print(solved)
		t.set_wait_time(5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		await t.timeout
		print("Timeout")
		self.set_visible(false)
		textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
		lineEdit.clear()	
	else:
		textLabel.set_text("The code does not match.\n Maybe, try one more time?")

func _on_visibility_changed():
	lineEdit.clear()
	textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
	if whichDoor == "FirstDoor" and doorCounter == 1:
		codetoSolve.texture = ResourceLoader.load("res://code1Maz`e.png")
	if whichDoor == "SecondDoor" and doorCounter == 2:
		codetoSolve.texture = ResourceLoader.load("res://code2Maze.PNG")
	if whichDoor == "ThirdDoor" and doorCounter == 3:
		codetoSolve.texture == ResourceLoader.load("res://code3Maze.PNG")
	if whichDoor == "FourthDoor" and doorCounter == 4:
		pass
	if whichDoor == "FifthDoor" and doorCounter == 5:
		codetoSolve.texture = ResourceLoader.load("res://fakedoor1code.PNG")	
	if whichDoor == "FakeDoor1" and doorCounter == 100:
		codetoSolve.texture = ResourceLoader.load("res://fakedoor1code.PNG")
	
