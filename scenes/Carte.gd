# Carte.gd

extends Control

var nom
var description
var texture

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureButton.texture_normal = texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _utiliser():
	pass
