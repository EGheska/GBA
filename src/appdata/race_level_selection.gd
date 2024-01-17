extends CanvasLayer

@onready var pause = $Pause
@onready var lvl2 = $Control/MarginContainer/HBoxContainer/Button2
@onready var lvl3 = $Control/MarginContainer/HBoxContainer/Button4

@onready var BackButton = $Control/MarginContainer/VBoxContainer/HBoxContainer/BackButton
@onready var PauseButton = $Control/MarginContainer/VBoxContainer/HBoxContainer/PauseButton


static var isNextlevelOpen

static var isThirdLevelOpen

var config = ConfigFile.new()

func set_isNextLevelOpen(value):
	isNextlevelOpen = value
	
func set_isThirdLevelOpen(value):
	isThirdLevelOpen = value
	
func costyl():
	if config.load("res://settings3.cfg") != OK:
		config.set_value("Level2R", "noacces", true)
		config.set_value("Level3R", "noacces", true)
	print(config.get_value("Level2R", "noacces"))
	print(config.get_value("Level3R", "noacces"))
	if config.get_value("Level2R", "noacces") == true:
		lvl2.icon = ResourceLoader.load("res://assets/Lock closed.png")
		lvl2.disabled = true
		lvl2.text = ""
	if config.get_value("Level3R", "noacces") == true:
		lvl3.icon = ResourceLoader.load("res://assets/Lock closed.png")
		lvl3.disabled = true
		lvl3.text = ""
	config.save("res://settings3.cfg")
	
	if config.get_value("Level2R", "noacces") == false:
		lvl2.disabled = false
	if config.get_value("Level3R", "noacces") == false:
		lvl3.disabled = false

func _ready():
	print(config.get_value("Level2R", "noacces"))
	print(config.get_value("Level3R", "noacces"))
	costyl()
	
	config.load("res://settings.cfg")

	if config.get_value("language", "mode") == "dutch":	
		BackButton.text = "Terug"
		PauseButton.text = "Pauze"
		$Control/MarginContainer/VBoxContainer/HBoxContainer2/Label.text = "Wiskunde race"
	elif config.get_value("language", "mode") == "english":
		pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://math_race_level1.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://math_race_level2.tscn")


func _on_button_4_pressed():
	get_tree().change_scene_to_file("res://math_race_level3.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")


func _on_pause_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/pause_menu.tscn")
