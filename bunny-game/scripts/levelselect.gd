extends Node2D

# button type is just for the back button
var current_level: int = 1
var level_unlocked: int = 1
var max_level: int = 5
var button_type = null

# When level to unlock is bigger then the unlocked level amount, the unlocked level amount will 
# set itself to be equal to level to unlock 
func _unlock_level(level_to_unlock: int) -> void:
	if level_to_unlock > level_unlocked:
		level_unlocked = level_to_unlock
	
# if level to load is bigger then the max level, sents itself to main menu
# str goes to levels folder, then loads the level equal to level to load and adds .tcsn on it
func _load_level(level_to_load: int) -> String:
	if level_to_load > max_level:
		return "res://scenes/mainmenu.tscn"
	return str("res://levels/", level_to_load, ".tscn")

# back

func _on_back_pressed():
	button_type = "back"
	$Levelselect/transition.show()
	$Levelselect/transition/fade_timer.start()
	$Levelselect/transition/fade.play("fade_in")
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
