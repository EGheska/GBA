class_name solver extends Popup

@onready var textLabel = $Control/Label
@onready var codetoSolve = $Control/CodeToSolve
@onready var cheetSheet = $Control/CheetSheet
@onready var lineEdit = $Control/LineEdit
@onready var cheetSheetLvl2 = $Control/CheetSheetLvl2
@onready var cheatSheetlvl3 = $Control/CheatSheetLvl3

var levelAccess = LevelSelelctor.new()
var config = ConfigFile.new()

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
static var levelCounter

static func setLevelCounter(value):
	levelCounter = value

static func _set_solve(value):
	solved = value

static func __set(property, value):
	whichDoor = property
	doorCounter = value
	
static func __get():
	return whichDoor

func _ready():
	config.load("res://settings2.cfg")
	lineEdit.focus_mode = 2
	

func timer_func():
	print("Start")
	await get_tree().create_timer(1.5).timeout
	print("Timeout")
	self.set_visible(false)
	textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
	lineEdit.clear()

func _on_texture_button_pressed():
	textLabel.set_text("You have to solve the puzzle!\nYou can find a key for decipher the code in the message left for you.\n Use that to so")


func _on_line_edit_text_submitted(new_text):
	
	if levelCounter == 1:
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
					levelAccess.set_isNextLevelOpen(true)
					config.load("res://settings2.cfg")
					config.set_value("Level2", "noacces", false)
					print(config.get_value("Level2", "noacces"))
					print(config.get_value("Level3", "noacces"))
					config.save("res://settings2.cfg")
					await get_tree().create_timer(3).timeout
					self.set_visible(false)
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
	elif levelCounter == 2:
		match doorCounter:
			1:
				if new_text.to_int() == 1245:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			2:
				if new_text.to_int() == 3492:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			3:
				if new_text.to_int() == 8567:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			4:
				if new_text.to_int() == 8642:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			5:
				if new_text.to_int() == 6273:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			6:
				if new_text.to_int() == 1928:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			7:
				if new_text.to_int() == 7329:
					textLabel.set_text("Congratulations!\nYou have solved the final code!")
					config.load("res://settings2.cfg")
					config.set_value("Level3", "noacces", false)
					print(config.get_value("Level2", "noacces"))
					print(config.get_value("Level3", "noacces"))
					config.save("res://settings2.cfg")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			100:
				if new_text.to_int() == 4961:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			200:
				if new_text.to_int() == 5316:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")	
			300:
				if new_text.to_int() == 5861:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			400:
				if new_text.to_int() == 6945:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
	elif levelCounter == 3:
		match doorCounter:
			1:
				if new_text.to_int() == 2748:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			2:
				if new_text.to_int() == 2519:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			3:
				if new_text.to_int() == 3275:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			4:
				if new_text.to_int() == 6913:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			5:
				if new_text.to_int() == 2942:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			6:
				if new_text.to_int() == 7478:
					textLabel.set_text("Congratulations!\nYou have solved the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			7:
				if new_text.to_int() == 8152:
					textLabel.set_text("Congratulations!\nYou have solved final the code!")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			100:
				if new_text.to_int() == 9541:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			200:
				if new_text.to_int() == 6681:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			300:
				if new_text.to_int() == 4637:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			400:
				if new_text.to_int() == 7636:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			500:
				if new_text.to_int() == 2442:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			600:
				if new_text.to_int() == 2942:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			700:
				if new_text.to_int() == 6913:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
			800:
				if new_text.to_int() == 4637:
					textLabel.set_text("Oops! Seems like you've solved the fake door")
					_set_solve(true)
					timer_func()
				else:
					textLabel.set_text("The code does not match.\nMaybe, try one more time?")
				
func _on_visibility_changed():
	
	
	if levelCounter == 1:
		cheetSheetLvl2.set_visible(false)
		cheetSheet.set_visible(true)
		cheatSheetlvl3.set_visible(false)
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
	
	if levelCounter == 2:
		
		cheetSheet.set_visible(false)
		cheetSheetLvl2.set_visible(true)
		cheatSheetlvl3.set_visible(false)
		print("level 2")
		print(whichDoor, doorCounter)
		lineEdit.clear()
		textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
		
		match doorCounter:
			1:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2c1.png")
			2:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2c2.png")
			3:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2c3.png")
			4:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2c4.png")
			5:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2c5.png")
			6:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2c6.png")
			7:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2c7.png")
			100:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2f1.png")
			200:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2f2.png")
			300:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2f3.png")
			400:
				codetoSolve.texture = ResourceLoader.load("res://assets/mazel2f4.png")
				
	if levelCounter == 3:
		
		cheetSheet.set_visible(false)
		cheetSheetLvl2.set_visible(false)
		cheatSheetlvl3.set_visible(true)
		print("level 3")
		print(whichDoor, doorCounter)
		lineEdit.clear()
		textLabel.set_text("Based on the code on the right suggest a answer for the maze!")
		
		match doorCounter:
			1:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3c1.PNG")
			2:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3c2.PNG")
			3:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3c3.PNG")
			4:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3c4.PNG")
			5:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3c5.PNG")
			6:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3c6.PNG")
			7:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3c7.PNG")
			100:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3f1.PNG")
			200:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3f2.PNG")
			300:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3f3.PNG")
			400:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3f4.PNG")
			500:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3f5.PNG")
			600:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3c5.PNG")
			700:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3c4.PNG")
			800:
				codetoSolve.texture = ResourceLoader.load("res://assets/maze3f3.PNG")
