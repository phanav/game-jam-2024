extends RigidBody2D
signal hit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_entered(body_rid:RID, body:Node, body_shape_index:int, local_shape_index:int):
	# pass # Replace with function body.
	hit.emit()
	print(body.name)
