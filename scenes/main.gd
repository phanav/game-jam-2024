# main.gd
extends Node

var healthy_cells = []
var cancer_cells = []
var target_radius = 20
var cancer_spawning_speed = 2

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
		else:
			healthy_cells.append(cell)

func _on_TargetArea_area_entered(area):
	print("Area entered: " + area.name)

# mort des cellules saines
func _on_healthy_cell_death_timer_timeout():
	healthy_cells.remove_at(randi() % healthy_cells.size())

# apparition des cellules cancers
func _on_cancer_cell_spawn_timer_timeout():
	var cell = load("res://scenes/cancer_cell.tscn").instantiate()
	cell.global_position = Vector2(randi() % get_viewport().size.x, randi() % get_viewport().size.y)
	add_child(cell)
	cancer_cells.append(cell)
