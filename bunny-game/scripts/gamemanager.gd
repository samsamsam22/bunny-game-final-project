extends Node

#keeps track of score in the current level, is just so carrot doesnt break
var score = 0
@onready var score_label = $score_label

func add_point():
	score += 1
	
