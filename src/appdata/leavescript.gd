extends Popup

func _ready():
	pass
	



func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/appdata/maze_level_selection.tscn")

func _on_no_but_pressed():
	self.set_visible(false)
