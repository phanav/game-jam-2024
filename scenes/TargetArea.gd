extends Area2D
signal hit

@export var radius : float=10:
	set(value):
		radius = value
		queue_redraw()

func _draw():
	# draw_circle(Vector2(0, 0), 10, Color.ORANGE)
	draw_arc(Vector2(0, 0), radius, 0, TAU, 100, Color.ORANGE)

# Called when the node enters the scene tree for the first time.
func _ready():
	# pass # Replace with function body.
	$TargetCollisionShape.disabled = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_target_area_body_entered(body):
	# pass # Replace with function body.
	hit.emit()
	print(body.name, get_stack()[0]["function"])


func _on_area_shape_entered(area_rid:RID, area:Area2D, area_shape_index:int, local_shape_index:int):
	# pass # Replace with function body.
	hit.emit()
	print(area.name, get_stack()[0]["function"])

func _on_area_entered(area:Area2D):
	pass # Replace with function body.
	hit.emit()
	print(area.name, get_stack()[0]["function"])


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	# pass # Replace with function body.
	hit.emit()
	print(body.name, ' ; ', get_stack()[0]["function"])