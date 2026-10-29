extends RefCounted

var questions := [
	{"prompt": "2 + 3 = ?", "options": [4, 5, 6], "answer": 5},
	{"prompt": "7 - 2 = ?", "options": [5, 4, 6], "answer": 5},
	{"prompt": "4 + 4 = ?", "options": [7, 9, 8], "answer": 8},
	{"prompt": "9 - 3 = ?", "options": [5, 6, 7], "answer": 6},
	{"prompt": "6 + 3 = ?", "options": [9, 8, 7], "answer": 9},
]
var current_index := 0
var wrong_attempts := 0
var correct_count := 0

func current_question() -> Dictionary:
	if finished(): return {}
	return questions[current_index]

func answer(value: int) -> bool:
	if finished(): return false
	if value != current_question().answer:
		wrong_attempts += 1
		return false
	correct_count += 1
	current_index += 1
	return true

func finished() -> bool:
	return current_index >= questions.size()

func reset() -> void:
	current_index = 0
	wrong_attempts = 0
	correct_count = 0
