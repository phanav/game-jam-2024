extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var start_button = get_node("StartButton")
	start_button.connect("pressed", Callable(self, "_on_start_button_pressed"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	var main_scene = load("res://scenes/main.tscn").instantiate()
	get_tree().root.add_child(main_scene)
	get_tree().set_current_scene(main_scene)
