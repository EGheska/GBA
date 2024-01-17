class_name winOrDefScreen extends CanvasLayer

@onready var config = ConfigFile.new()

func write_labels():
	$Control/ColorRect/Quit_Button.text = GlobalScript.get_quit_button_string()
	$Control/ColorRect/TryAgain.text = GlobalScript.get_try_again_button_string()
	$Control/ColorRect/Next_Level_Button.text = GlobalScript.get_next_level_button_string()
	check_next_level_availability()


func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")


func _on_try_again_pressed():
	if GlobalScript.levelCounter == 1:
		get_tree().change_scene_to_file("res://math_race_level1.tscn")
	elif GlobalScript.levelCounter == 2:
		get_tree().change_scene_to_file("res://math_race_level2.tscn")
	elif GlobalScript.levelCounter == 3:
		get_tree().change_scene_to_file("res://math_race_level3.tscn")


func _on_next_level_button_pressed():
	if GlobalScript.levelCounter == 1:
		get_tree().change_scene_to_file("res://math_race_level2.tscn")
	elif GlobalScript.levelCounter == 2:
		get_tree().change_scene_to_file("res://math_race_level3.tscn")


func _on_visibility_changed():
	if(self.visible):
		write_labels()
		check_next_level_availability()


func check_next_level_availability():
	config.load("res://settings3.cfg")
	if GlobalScript.levelCounter == 1 && config.get_value("Level2R", "noacces") == true:
		$Control/ColorRect/Next_Level_Button.disabled = true
	elif GlobalScript.levelCounter == 1 && config.get_value("Level2R", "noacces") == false:
		$Control/ColorRect/Next_Level_Button.disabled = false
	elif GlobalScript.levelCounter == 2 && config.get_value("Level3R", "noacces") == true:
		$Control/ColorRect/Next_Level_Button.disabled = true
	elif GlobalScript.levelCounter == 2 && config.get_value("Level3R", "noacces") == false:
		$Control/ColorRect/Next_Level_Button.disabled = false
	elif GlobalScript.levelCounter == 3:
		$Control/ColorRect/Next_Level_Button.disabled = true
	
