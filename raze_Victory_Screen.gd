class_name winOrDefScreen extends CanvasLayer





func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")


func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://math_race_level1.tscn")


func _on_button_pressed():
	
	if GlobalScript.levelCounter == 1:
		get_tree().change_scene_to_file("res://math_race_level2.tscn")
	elif GlobalScript.levelCounter == 2:
		pass
	
