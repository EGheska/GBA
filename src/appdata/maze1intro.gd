extends CanvasLayer

@onready var gameName = $ColorRect/Label
@onready var description = $ColorRect/Label2
@onready var backbutton = $Button2

var config = ConfigFile.new()

func _ready():
	config.load("res://settings.cfg")
	if config.get_value("language", "mode") == "dutch":
		gameName.text = "Het labyrinth"
		description.text = "In dit spel moet je het doolhof voltooien.\nHet doolhof bevat de deuren die zijn afgesloten met het codeslot.\nOm het slot te ontgrendelen, gebruikt u de codeknip die u vlakbij kunt vinden.\nGebruik de WASD-toetsen op het toetsenbord om je personage te verplaatsen"
		backbutton.text = "Terug"
		
func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_level_selection.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")
