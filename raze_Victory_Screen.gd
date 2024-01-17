class_name winOrDefScreen extends CanvasLayer


func write_labels():
	$Control/ColorRect/Quit_Button.text = GlobalScript.get_quit_button_string()
	$Control/ColorRect/TryAgain.text = GlobalScript.get_try_again_button_string()
	$Control/ColorRect/Next_Level_Button.text = GlobalScript.get_next_level_button_string()


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
	elif GlobalScript.levelCounter == 3:
		get_tree().change_scene_to_file("res://math_race_level1.tscn")


func _on_visibility_changed():
	if(self.visible):
		write_labels()
