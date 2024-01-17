extends Node

class LevelStack:
	var items := []
	
	func is_empty() -> bool:
		return items.size() == 0
		
	func push(item):
		items.append(item)
	
	func pop():
		if not is_empty():
			return items.pop_back()
		else:
			push_error("Trying to pop from an empty stack")
		
	func peek():
		if not is_empty():
			return items[items.size() - 1]
		else:
			push_error("peek from an empty stack")
		
	func size() -> int:
		return items.size()
		
func _init():
	LevelStack.new()
