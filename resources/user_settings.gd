class_name UserPreferences extends Resource

@export var displayOptions : GlobalSettings = GlobalSettings._getValue()

func save() -> void:
	ResourceSaver.save(self, "user://userset.tres")
	
	
static func load_or_create() -> UserPreferences:
	var res: UserPreferences = load("user://userset.tres") as UserPreferences
	if !res:
		res = UserPreferences.new()
	return res
