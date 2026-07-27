extends CharacterBody2D

# := auto assigns type of int - same as writing var speed: int = 500
@export var speed := 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(640, 600)


# Called every frame. 'delta' is the elapsed time since the previous frame.
# delta is a fraction that is smaller for higher framerates
func _process(delta: float) -> void:
	# direction vector keymaps are created in Project Settings -> Input Map
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
