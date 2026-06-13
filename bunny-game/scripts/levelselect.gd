extends Node2D

var current_level: int = 1
var level_unlocked: int = 1
var max_level: int = 5

func _unlock_level(level_to_unlock: int) -> void:
	if level_to_unlock > level_unlocked:
		level_unlocked = level_to_unlock
		
func _load_level(level_to_load: int) -> String:
	if level_to_load > max_level:
		return "res://scenes/mainmenu.tscn"
	return str("res://levels/", level_to_load, ".tscn")
