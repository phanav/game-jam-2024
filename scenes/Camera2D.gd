extends Camera2D

var speed = 320

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Vector2()

	if Input.is_action_pressed("camera_right"):
		movement.x += 1
	if Input.is_action_pressed("camera_left"):
		movement.x -= 1
	if Input.is_action_pressed("camera_down"):
		movement.y += 1
	if Input.is_action_pressed("camera_up"):
		movement.y -= 1

	movement = movement.normalized() * speed * delta

	position += movement
