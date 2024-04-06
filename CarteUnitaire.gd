# CarteUnitaire.gd

extends "res://scenes/Carte.gd"

enum Therapie {Immunotherapie, Radiotherapie, TherapiesCiblees, Chirurgie}
var therapie
var traitementEfficace #Pour savoir quel thérapie est efficace sur quel commandement

# Called when the node enters the scene tree for the first time.
func _ready():
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
	self.therapie = Therapie[randi() % Therapies.size()]

func setTherapie(therapie): # Affecte une thérapie à la carte
	self.therapie = therapie

func getTherapie(): # Renvoie la thérapie de la carte
	return self.therapie

