extends Node

var healthy_cells = []
var cancer_cells = []

var healthy_cell_rids = []
var cancer_cell_rids = []

var target_radius = 20
var cancer_spawning_speed = 2
var target_cell_rids = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_cells(10, "cancer")
	spawn_cells(100, "healthy")
	# vitesse d'apparition des cellules cancers
	$CancerCellSpawnTimer.wait_time = cancer_spawning_speed

	# https://gamedev.stackexchange.com/questions/207387/how-to-get-nested-child-node-without-using-full-path-in-godot
	$TargetArea.radius = target_radius
	# $Camera2D.get_node('TargetArea').radius = target_radius
	# print($Camera2D/TargetArea.radius )
	# $Camera2D/TargetArea/TargetCollisionShape.shape = CircleShape2D(target_radius)
	var circle_shape = CircleShape2D.new()
	circle_shape.radius = target_radius
	# $Camera2D/TargetArea/TargetCollisionShape.shape = circle_shape
	$TargetArea/TargetCollisionShape.set_shape(circle_shape)

	# print(len(cancer_cells))
	$TargetArea.connect("area_entered", _on_TargetArea_area_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$TargetArea/TargetCollisionShape.global_position = $Camera2D.get_screen_center_position()
	$HealthBar.update_healthy_count(healthy_cells.size())
	# print($Camera2D.get_screen_center_position())
	# print($Camera2D/TargetArea/TargetCollisionShape.position)
	# pass

func spawn_cells(count, type):
	var scene_path = "res://scenes/cancer_cell.tscn" if type == "cancer" else "res://scenes/healthy_cell.tscn"
	for i in range(count):
		var cell = load(scene_path).instantiate()
		cell.global_position = Vector2(randi() % get_viewport().size.x, randi() % get_viewport().size.y)
		add_child(cell)
		if type == "cancer":
			cancer_cells.append(cell)
			cancer_cell_rids.append(cell.get_rid())
		else:
			healthy_cells.append(cell)
			healthy_cell_rids.append(cell.get_rid())

func _on_TargetArea_area_entered(area):
	print("Area entered: " + area.name)

# mort des cellules saines
func _on_healthy_cell_death_timer_timeout():
	var index = randi() % healthy_cells.size()
	healthy_cells.remove_at(index)
	healthy_cell_rids.remove_at(index)

# apparition des cellules cancers
func _on_cancer_cell_spawn_timer_timeout():
	var cell = preload("res://scenes/cancer_cell.tscn").instantiate()
	cell.global_position = Vector2(randi() % get_viewport().size.x, randi() % get_viewport().size.y)
	add_child(cell)
	cancer_cells.append(cell)
	cancer_cell_rids.append(cell.get_rid())


func _on_target_area_target_body_entered(args):
	#pass # Replace with function body.
	print('main enter ', args)


func _on_target_area_target_body_exited(args):
	#pass # Replace with function body.
	print('main exit ', args)


func _on_target_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#pass # Replace with function body.
	# print(body.name, ' main enter ; ', body_rid, body.owner)
	# print(body_rid, body, body_shape_index, local_shape_index)
	target_cell_rids.append(body_rid)
	print(healthy_cell_rids.find(body_rid))
	print(cancer_cell_rids.find(body_rid))


func _on_target_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	#pass # Replace with function body.
	# print(body.name, ' main exit ; ', body_rid, body)
	# print(body_rid, body, body_shape_index, local_shape_index)
	if len(target_cell_rids) > 0:
		target_cell_rids.erase(body_rid)
