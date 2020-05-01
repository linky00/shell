extends RandomTimer

enum Effect {
	TEXT_RAPID,
	SINGLE_TEXT,
	SINGLE_VIDEO,
	MIRROR,
}


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Q:
			get_tree().quit()
