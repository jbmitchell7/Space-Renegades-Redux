extends CharacterBody2D

# := auto assigns type of int - same as writing var speed: int = 500
@export var speed := 500
var can_shoot := true

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(640, 600)


# Called every frame. 'delta' is the elapsed time since the previous frame.
# delta is a fraction that is smaller for higher framerates
func _process(_delta: float) -> void:
	# direction vector keymaps are created in Project Settings -> Input Map
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
		  
	#shoot input
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPosition.global_position)
		can_shoot = false
		$LaserCooldown.start()
		$LaserSound.play()


func _on_laser_cooldown_timeout() -> void:
	can_shoot = true
	
func play_damage_sound():
	$DamageSound.play()
