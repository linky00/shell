extends Control

export(PackedScene) var text_layer_scene
export(int) var max_text_layers = 4
var text_layers = []

onready var area = $TextSpawnArea


func _on_TextSpawn_spawn_text_layer(text):
	var text_layer = text_layer_scene.instance()
	add_child(text_layer)
	text_layer.text = text
	randomize()
	var x_spawn = rand_range(area.rect_position.x, area.rect_position.x + area.rect_size.x)
	var y_spawn = rand_range(area.rect_position.y, area.rect_position.y + area.rect_size.y)
	text_layer.rect_position = Vector2(x_spawn, y_spawn)
	text_layers.append(text_layer)
	if text_layers.size() > max_text_layers:
		text_layers.pop_front().queue_free()
