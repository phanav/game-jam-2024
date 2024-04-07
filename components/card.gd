extends TextureButton
signal use_card(card_type, target_radius)

var therapie = ["Chimiotherapie", "Immunotherapie", "Radiotherapie", "TherapieCiblee", "Chirurgie", "Analyse"]
var textures = [preload("res://art/cartes_art/Chimiotherapie.svg"), preload("res://art/cartes_art/Immunotherapie.svg"), preload("res://art/cartes_art/Radiotherapie.svg"), preload("res://art/cartes_art/TherapiesCiblees.svg"), preload("res://art/cartes_art/Chirurgie.svg"), preload("res://art/cartes_art/Analyse.svg")]
var hover_textures = [preload("res://art/cartes_art/Chimiotherapie-rayon.svg"), preload("res://art/cartes_art/Immunotherapie-rayon.svg"), preload("res://art/cartes_art/Radiotherapie-rayon.svg"), preload("res://art/cartes_art/TherapiesCiblees-rayon.svg"), preload("res://art/cartes_art/Chirurgie-rayon.svg"), preload("res://art/cartes_art/Analyse-rayon.svg")]

var target_radius
var current_therapie

# Chimiotherapie -> all
# Immunotherapie -> shield
# Radiotherapie -> precoce
# TherapieCiblee -> mutateStar
# Chirurgie -> timed
# Analyse -> show

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", Callable(self, "_on_button_pressed"))  # Connecter le signal pressed à la fonction _on_button_pressed
	reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	emit_signal("use_card", current_therapie, target_radius)
	reset()

func reset():
	randomize()  # Initialiser le générateur de nombres aléatoires
	var index = randi() % therapie.size()  # Générer un index aléatoire
	self.texture_normal = textures[index]  # Sélectionner la texture correspondante
	self.texture_hover = hover_textures[index]  # Assigner la texture hover correspondante
	current_therapie = therapie[index]  # Stocker le type de thérapie actuel
	set_target_radius()

func set_target_radius():
	if (current_therapie == "Chimiotherapie"):
		target_radius = 30.0
	else:
		target_radius = 5.0
