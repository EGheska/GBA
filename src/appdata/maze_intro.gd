extends CanvasLayer




func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_game.tscn")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://src//appdata/maze_level_selection.tscn")
