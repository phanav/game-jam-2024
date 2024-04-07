extends TextureButton
signal use_card(card_type, target_radius)


var therapie = ["Chimiotherapie", "Immunotherapie", "Radiotherapie", "TherapieCiblee", "Chirurgie", "Analyse"]
var textures = [preload("res://art/cartes_art/Chimiotherapie.png"), preload("res://art/cartes_art/Immunotherapie.png"), preload("res://art/cartes_art/Radiotherapie.png"), preload("res://art/cartes_art/TherapiesCiblees.png"), preload("res://art/cartes_art/Chirurgie.png"), preload("res://art/cartes_art/Analyse.png")]
var hover_textures = [preload("res://art/cartes_art/Chimiotherapie-rayon.svg"), preload("res://art/cartes_art/Immunotherapie-rayon.svg"), preload("res://art/cartes_art/Radiotherapie-rayon.svg"), preload("res://art/cartes_art/TherapiesCiblees-rayon.svg"), preload("res://art/cartes_art/Chirurgie-rayon.svg"), preload("res://art/cartes_art/Analyse-rayon.svg")]
var commandements_enum = ["all", "shield", "precoce", "mutateStar", "timed", "show"]
var radius = [50.0, 10.0, 10.0, 10.0, 10.0, 10.0]

var therapie_index
var target_commandement
var target_radius
var current_therapie
var fixed_pos

# Chimiotherapie -> all
# Immunotherapie -> shield
# Radiotherapie -> precoce
# TherapieCiblee -> mutateStar
# Chirurgie -> timed
# Analyse -> show

# Called when the node enters the scene tree for the first time.
func _ready():
	fixed_pos = position
	connect("pressed", Callable(self, "_on_button_pressed"))  # Connecter le signal pressed à la fonction _on_button_pressed
	connect("mouse_entered", Callable(self, "_on_button_focus_entered"))
	connect("mouse_exited", Callable(self, "_on_button_focus_exited"))
	reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	emit_signal("use_card", current_therapie, target_radius)
	reset()

func _on_button_focus_entered():
	var tween = create_tween()
	tween.tween_property(self, "position", fixed_pos - Vector2(0, 40), 0.25).set_trans(Tween.TRANS_CUBIC)

func _on_button_focus_exited():
	var tween = create_tween()
	tween.tween_property(self, "position", fixed_pos, 0.25).set_trans(Tween.TRANS_CUBIC)

func reset():
	randomize()  # Initialiser le générateur de nombres aléatoires
	therapie_index = randi() % therapie.size()  # Générer un index aléatoire
	self.texture_normal = textures[therapie_index]  # Sélectionner la texture correspondante
	#self.texture_hover = hover_textures[therapie_index]  # Assigner la texture hover correspondante
	current_therapie = therapie[therapie_index]  # Stocker le type de thérapie actuel
	target_radius = radius[therapie_index]
	target_commandement = commandements_enum[therapie_index]
