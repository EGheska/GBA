extends Node


func toggle_fullscreen(value):
	if value == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)		
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
