class_name Spawn
extends Timer

export(float) var min_time = 3.0
export(float) var max_time = 6.0


func _ready():
	reset_timer()


func spawn_layer():
	pass


func reset_timer():
	randomize()
	start(rand_range(min_time, max_time))


func _on_timeout():
	reset_timer()
	spawn_layer()
