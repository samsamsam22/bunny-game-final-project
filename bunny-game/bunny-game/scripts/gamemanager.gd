extends Node

signal score_changed(score)

var score := 0

func add_point():
	score += 1
	score_changed.emit(score)

func reset_score():
	score = 0
	score_changed.emit(score)
