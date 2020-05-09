extends VideoPlayer

signal video_finished


func _on_VideoPlayer_finished():
	play()
	emit_signal("video_finished")
