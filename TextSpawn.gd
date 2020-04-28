extends Node

signal spawn_text_layer(text)

var text_echoes = PoolStringArray()

export(float) var min_time = 2.0
export(float) var max_time = 4.0

onready var timer = $Timer


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
	reset_timer()


func spawn_text_layer():
	randomize()
	emit_signal("spawn_text_layer", text_echoes[randi() % text_echoes.size()])


func reset_timer():
	randomize()
	timer.start(rand_range(min_time, max_time))


func _on_Timer_timeout():
	reset_timer()
	spawn_text_layer()
