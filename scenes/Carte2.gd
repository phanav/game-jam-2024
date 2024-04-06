# Carte1.gd

extends TextureButton

var therapie = ["Chimiotherapie", "Immunotherapie", "Radiotherapie", "TherapieCiblee", "Chirurgie", "Analyse"]
var textures = [preload("res://art/cartes_art/Chimiotherapie.svg"), preload("res://art/cartes_art/Immunotherapie.svg"), preload("res://art/cartes_art/Radiotherapie.svg"), preload("res://art/cartes_art/TherapiesCiblees.svg"), preload("res://art/cartes_art/Chirurgie.svg"), preload("res://art/cartes_art/Analyse.svg")]
var hover_textures = [preload("res://art/cartes_art/Chimiotherapie-rayon.svg"), preload("res://art/cartes_art/Immunotherapie-rayon.svg"), preload("res://art/cartes_art/Radiotherapie-rayon.svg"), preload("res://art/cartes_art/TherapiesCiblees-rayon.svg"), preload("res://art/cartes_art/Chirurgie-rayon.svg"), preload("res://art/cartes_art/Analyse-rayon.svg")]

var current_therapie

# Chimiotherapie -> all
# Immunotherapie -> shield
# Radiotherapie -> precoce
# TherapieCiblee -> mutateStar
# Chirurgie -> timed
# Analyse -> show

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()
	connect("pressed", Callable(self, "_on_button_pressed"))  # Connecter le signal pressed à la fonction _on_button_pressed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	_utiliser()

func _utiliser():
	var used_therapie = current_therapie  # Stocker le type de thérapie actuel
	reset()  # Réinitialiser la carte
	return used_therapie  # Renvoyer le type de thérapie utilisé

func reset():
	randomize()  # Initialiser le générateur de nombres aléatoires
	var index = randi() % therapie.size()  # Générer un index aléatoire
	self.texture_normal = textures[index]  # Sélectionner la texture correspondante
	self.texture_hover = hover_textures[index]  # Assigner la texture hover correspondante
	current_therapie = therapie[index]  # Stocker le type de thérapie actuel


func _on_pressed():
	pass # Replace with function body.
