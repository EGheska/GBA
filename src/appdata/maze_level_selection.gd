class_name LevelSelelctor extends CanvasLayer

static var isNextlevelOpen

static var isThirdLevelOpen

func set_isNextLevelOpen(value):
	isNextlevelOpen = value
	
func set_isThirdLevelOpen(value):
	isThirdLevelOpen = value

func _init():
	isNextlevelOpen = true
	isThirdLevelOpen = true


func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze1intro.tscn")


func _on_button_2_pressed():
	if isNextlevelOpen:
		get_tree().change_scene_to_file("res://src/appdata/maze2intro.tscn")
	else:
		pass


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_intro.tscn")


func _on_button_4_pressed():
	if isThirdLevelOpen:
		get_tree().change_scene_to_file("res://src/appdata/maze3_intro.tscn")
	else:
		pass
