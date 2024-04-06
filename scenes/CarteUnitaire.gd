# CarteUnitaire.gd

extends "res://scenes/Carte.gd"

enum Therapie {Immunotherapie, Radiotherapie, TherapiesCiblees, Chirurgie}
var therapie
var traitementEfficace # Pour savoir quel thérapie est efficace sur quel commandement

var textures

# Called when the node enters the scene tree for the first time.
func _ready():
	textures = {
		Therapie.Immunotherapie: $Immunotherapie.texture,
		Therapie.Radiotherapie: $Radiotherapie.texture,
		Therapie.TherapiesCiblees: $TherapieCiblee.texture,
		Therapie.Chirurgie: $Chirurgie.texture
	}
	choisir_therapie()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _utiliser():
	# On hérite cette fonction de la classe abstraite Carte, utiliser() aura une fonction différente en fonction
	# de la thérapie de la carte
	pass

func choisir_therapie():
	# On choisit aléatoirement une thérapie pour la carte
	var therapies = [Therapie.Immunotherapie, Therapie.Radiotherapie, Therapie.TherapiesCiblees, Therapie.Chirurgie]
	self.therapie = therapies[randi() % therapies.size()]
	self.texture = textures[self.therapie]
