# Carte1.gd

extends TextureButton

var therapie = ["Chimiotherapie", "Immunotherapie", "Radiotherapie", "TherapieCiblee", "Chirurgie", "Analyse"]
var textures = [preload("res://art/cartes_art/Chimiotherapie.svg"), preload("res://art/cartes_art/Immunotherapie.svg"), preload("res://art/cartes_art/Radiotherapie.svg"), preload("res://art/cartes_art/TherapiesCiblees.svg"), preload("res://art/cartes_art/Chirurgie.svg"), preload("res://art/cartes_art/Analyse.svg")]
var hover_textures = [preload("res://art/cartes_art/Chimiotherapie-rayon.svg"), preload("res://art/cartes_art/Immunotherapie-rayon.svg"), preload("res://art/cartes_art/Radiotherapie-rayon.svg"), preload("res://art/cartes_art/TherapiesCiblees-rayon.svg"), preload("res://art/cartes_art/Chirurgie-rayon.svg"), preload("res://art/cartes_art/Analyse-rayon.svg")]

# Chimiotherapie -> all
# Immunotherapie -> shield
# Radiotherapie -> precoce
# TherapieCiblee -> mutateStar
# Chirurgie -> timed
# Analyse -> show

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()  # Initialiser le générateur de nombres aléatoires
	var index = randi() % therapie.size()  # Générer un index aléatoire
	self.texture_normal = textures[index]  # Sélectionner la texture correspondante
	self.texture_hover = hover_textures[index]  # Assigner la texture hover correspondante

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _utiliser():
	pass
