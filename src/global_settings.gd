extends Node

func toggle_fullsreen(value):
	var mode = DisplayServer.window_get_mode();
	if value == 3 && mode != DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif value == 3 && mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif value == 0 && mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif value == 0 && mode != DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
	#if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_MAXIMIZED:
	#	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	#else:
	#	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
