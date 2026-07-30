extends Control

@export var level_scene: PackedScene = load("res://level.tscn")

func _ready() -> void:
	$CenterContainer/VBoxContainer/Score.text = $CenterContainer/VBoxContainer/Score.text + str(Global.score)

func _input(event):
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
