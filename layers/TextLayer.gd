extends Label

var char_speed = 10.0


func _process(delta):
	if percent_visible < 1.0:
		percent_visible += delta * (char_speed / text.length())
