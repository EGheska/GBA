class_name LevelSelelctor extends CanvasLayer

static var isNextlevelOpen

func set_isNextLevelOpen(value):
	isNextlevelOpen = value

func _init():
	isNextlevelOpen = true


func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_game.tscn")


func _on_button_2_pressed():
	if isNextlevelOpen:
		get_tree().change_scene_to_file("res://src/appdata/maze_game_lvl2.tscn")
	else:
		pass
