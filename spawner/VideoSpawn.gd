extends Spawn

signal spawn_video_layer(video)

var video_echoes = []


func _ready():
	var dir = Directory.new()
	dir.open("res://echoes/video")
	dir.list_dir_begin(true)
	while true:
		var file_name = dir.get_next()
		if file_name != "":
			video_echoes.append(load("res://echoes/video/" + file_name))
		else:
			break


func spawn_layer():
	randomize()
	emit_signal("spawn_video_layer", video_echoes[randi() % video_echoes.size()])

