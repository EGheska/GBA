extends Popup
var config = ConfigFile.new()
func _ready():
	config.load("res://settings.cfg")
	if config.get_value("language", "mode") == "dutch":
		$VBoxContainer/HBoxContainer/YraBut.text = "Ja"
		$VBoxContainer/HBoxContainer/NoBut.text = "Nee"
		$VBoxContainer/Label.text = "Weet je zeker dat je weg wilt?\nJe voortgang wordt niet opgeslagen"
	



func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_level_selection.tscn")

func _on_no_but_pressed():
	self.set_visible(false)
