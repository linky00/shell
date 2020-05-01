extends RandomTimer

signal spawn_text_layer(text)

var text_echoes = PoolStringArray()


func _ready():
	var dir = Directory.new()
	dir.open("res://echoes/text")
	dir.list_dir_begin(true)
	while true:
		var file_name = dir.get_next()
		if file_name != "":
			var file = File.new()
			file.open("res://echoes/text/" + file_name, File.READ)
			var contents = file.get_as_text()
			file.close()
			text_echoes += contents.split("\n")
		else:
			break


func activate():
	randomize()
	emit_signal("spawn_text_layer", text_echoes[randi() % text_echoes.size()])
