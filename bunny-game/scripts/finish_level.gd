extends Area2D

# adds a level to the current level then unlocks that level by calling the current level, allowing you to go to another level
func _on_body_entered(body: Node2D):
	Levelselect.current_level += 1
	Levelselect._unlock_level(Levelselect.current_level)
	var level_to_load: String = Levelselect._load_level(Levelselect.current_level)
	if level_to_load == "":
		return
	get_tree().change_scene_to_file("res://scenes/levelselect.tscn")
	
