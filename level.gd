extends Node2D

# load scene
var meteor_scene: PackedScene = load("res://meteor.tscn")

func _on_meteor_timer_timeout() -> void:
	# create instance
	var meteor = meteor_scene.instantiate()
	# attach to scene tree
	$Meteors.add_child(meteor)
