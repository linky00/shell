extends RandomTimer

enum Effect {
	TEXT_RAPID,
	SINGLE_TEXT,
	SINGLE_VIDEO,
	MIRROR,
}


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Q:
			get_tree().quit()
