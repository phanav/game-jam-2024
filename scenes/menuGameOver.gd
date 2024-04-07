extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOverSound.play()  # Play the game over sound


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_rejouer_bouton_pressed():
	var main_scene = load("res://scenes/main.tscn").instantiate()
	get_tree().root.add_child(main_scene)
	get_tree().current_scene.queue_free()
	get_tree().set_current_scene(main_scene)

func _on_retour_menu_bouton_pressed():
	var menu_scene = load("res://scenes/menuDemarrer.tscn").instantiate()
	get_tree().root.add_child(menu_scene)
	get_tree().current_scene.queue_free()
	get_tree().set_current_scene(menu_scene)
