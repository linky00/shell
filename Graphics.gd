extends Control

export(PackedScene) var text_layer_scene
export(PackedScene) var video_layer_scene
export(int) var max_text_layers = 4
export(int) var max_video_layers = 3
var text_layers = []
var video_layers = []

onready var text_area = $TextSpawnArea


func _on_TextSpawn_spawn_text_layer(text):
	var text_layer = text_layer_scene.instance()
	add_child(text_layer)
	text_layer.text = text
	randomize()
	var x_spawn = rand_range(text_area.rect_position.x, text_area.rect_position.x + \
	text_area.rect_size.x)
	var y_spawn = rand_range(text_area.rect_position.y, text_area.rect_position.y + \
	text_area.rect_size.y)
	text_layer.rect_position = Vector2(x_spawn, y_spawn)
	text_layers.append(text_layer)
	if text_layers.size() > max_text_layers:
		text_layers.pop_front().queue_free()


func _on_VideoSpawn_spawn_video_layer(video):
	var video_layer = video_layer_scene.instance()
	add_child(video_layer)
	video_layer.stream = video
	video_layer.play()
	var video_size = video_layer.get_video_texture().get_size()
	var aspect_ratio = video_size.x / video_size.y
	var x_size
	var y_size
	randomize()
	if rect_size.x < rect_size.y:
		x_size = rand_range(rect_size.x * 0.75, rect_size.x)
		y_size = x_size / aspect_ratio
	else:
		y_size = rand_range(rect_size.y * 0.75, rect_size.y)
		x_size = y_size * aspect_ratio
	var x_position = rand_range(0.0, rect_size.x - x_size)
	var y_position = rand_range(0.0, rect_size.y - y_size)
	video_layer.rect_position = Vector2(x_position, y_position)
	video_layer.rect_size = Vector2(x_size, y_size)
	video_layers.append(video_layer)
	if video_layers.size() > max_video_layers:
		video_layers.pop_front().queue_free()
