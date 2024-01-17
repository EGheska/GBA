extends CanvasLayer

@onready var gameName = $ColorRect/Label
@onready var description = $ColorRect/Label2

var config = ConfigFile.new()

func _ready():
	config.load("res://settings.cfg")
	if config.get_value("language", "mode") == "dutch":
		gameName.text = "Het labyrinth"

func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_level_selection.tscn")
