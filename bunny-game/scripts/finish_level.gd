extends Area2D

func _on_body_entered(body: Node2D):
	Levelselect.current_level += 1
	Levelselect._unlock_level(Levelselect.current_level)
	var level_to_load: String = Levelselect._load_level(Levelselect.current_level)
	if level_to_load == "":
		return
	get_tree().change_scene_to_file("res://scenes/levelselect.tscn")
	
