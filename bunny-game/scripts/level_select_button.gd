extends Button

var level: int = 1
var is_unlocked: bool = false
@onready var score_label = $ScoreLabel

# sets itself to it's index order (the button in the second position will automatically be index 1)
# remember the label above the first button allows it to go without a +1, but usually it should have 
# one
# only unlocked if level unlocked is equal to it's level, if it is, sets opacity to 1 and if not
# sets itself to 0
func _ready() -> void:
	level = get_index()
	text = str(level)
	is_unlocked = level <= Levelselect.level_unlocked
	modulate.a = 1.0 if is_unlocked else 0.5
	score_label.text = str(Levelselect.get_level_score(level)) + " Carrots"
	
	# if is unlocked, goes to level selects current level and sets it to be equal to this nodes level
	# then it gets the tree to call the load level func
func _pressed() -> void:
	if is_unlocked:
		Levelselect.current_level = level
		get_tree().call_deferred("change_scene_to_file", Levelselect._load_level(level))
