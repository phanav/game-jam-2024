extends Area2D

@export var radius : float=10:
	set(value):
		radius = value
		#queue_redraw()

func _draw():
	## draw_circle(Vector2(0, 0), 10, Color.ORANGE)
	draw_arc(Vector2(0, 0), radius, 0, TAU, 100, Color.ORANGE)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
