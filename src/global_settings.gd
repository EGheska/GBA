extends Node



var _value = null

func toggle_fullscreen(value):
	if value == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		_value = value
		
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		_value = value

func _getValue():
	return _value
