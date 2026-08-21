extends CanvasLayer

@onready var score_label = $Control/score_label

func _ready():
	Gamemanager.score_changed.connect(update_score)
	update_score(Gamemanager.score)

func update_score(score: int):
	score_label.text = "Carrots: %d" % score
