extends RigidBody2D

var asteroid_small_scene := load("res://Scenes/AsteroidSmall.tscn")

var is_exploded := false

func explode():
	if is_exploded:
		return

	is_exploded = true
	
	_spawn_asteroid_small()

	get_parent().remove_child(self)
	queue_free()

func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	queue_free()

func _spawn_asteroid_small():
	var asteroid_small = asteroid_small_scene.instance()
	asteroid_small.position = self.position
	get_parent().add_child(asteroid_small)
