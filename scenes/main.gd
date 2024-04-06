# main.gd
extends Node


var healthy_cells = []
var cancer_cells = []


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_cells(10, "cancer")
	spawn_cells(100, "healthy")
	
	
	print(len(healthy_cells))
	print(len(cancer_cells))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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


