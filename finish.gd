extends CanvasLayer

func timer():
	print("Start")
	await get_tree().create_timer(5).timeout
	print("Timeout")
	
func _ready():
	timer()
	get_tree().change_scene_to_file("res://src/gui/game_selection.tscn")
