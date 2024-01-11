class_name LevelSelelctor extends CanvasLayer

@onready var pause = $Pause
@onready var lvl2 = $Control/MarginContainer/HBoxContainer/Button2
@onready var lvl3 = $Control/MarginContainer/HBoxContainer/Button4

static var isNextlevelOpen

static var isThirdLevelOpen

var config = ConfigFile.new()

func set_isNextLevelOpen(value):
	isNextlevelOpen = value
	
func set_isThirdLevelOpen(value):
	isThirdLevelOpen = value
	
func costyl():
	if config.load("res://settings2.cfg") != OK:
		config.set_value("Level2", "noacces", true)
		config.set_value("Level3", "noacces", true)
	print(config.get_value("Level2", "noacces"))
	print(config.get_value("Level3", "noacces"))
	if config.get_value("Level2", "noacces") == true:
		lvl2.icon = ResourceLoader.load("res://assets/Lock closed.png")
		lvl2.disabled = true
		lvl2.text = ""
	if config.get_value("Level3", "noacces") == true:
		lvl3.icon = ResourceLoader.load("res://assets/Lock closed.png")
		lvl3.disabled = true
		lvl3.text = ""
	config.save("res://settings2.cfg")
	
	if config.get_value("Level2", "noacces") == false:
		lvl2.disabled = false
	if config.get_value("Level3", "noacces") == false:
		lvl3.disabled = false

func _ready():
	print(config.get_value("Level2", "noacces"))
	print(config.get_value("Level3", "noacces"))
	costyl()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze1intro.tscn")


func _on_button_2_pressed():
		get_tree().change_scene_to_file("res://src/appdata/maze2intro.tscn")

		
func _on_button_4_pressed():
		get_tree().change_scene_to_file("res://src/appdata/maze3_intro.tscn")



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_intro.tscn")


func _on_pause_button_pressed():
	if !pause.visible:
		pause.set_visible(true)
	else:
		pause.set_visible(false)
