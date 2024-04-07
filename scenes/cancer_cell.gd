extends RigidBody2D

# Chimiotherapie -> all
# Immunotherapie -> shield
# Radiotherapie -> precoce
# TherapieCiblee -> mutateStar
# Chirurgie -> timed
# Analyse -> show
var commandements_enum = ["all", "shield", "precoce", "mutateStar", "timed"]
var commandements = []

# Called when the node enters the scene tree for the first time.
func _ready():
	commandements.append(commandements_enum[randi() % commandements_enum.size()])
	if (randi() % 2 == 0):
		commandements.append(commandements_enum[randi() % commandements_enum.size()])
	if (randi() % 3 == 0):
		commandements.append(commandements_enum[randi() % commandements_enum.size()])
	$AnalysisOverlay.display_commandements(commandements)
	# print($AnalysisOverlay.rotation)
	# $AnalysisOverlay.rotation = 0
	# pass # Replace with function body.

func _is_in(list, item):
	return list.count(item) > 0

func is_matching_card(card_type):
	return _is_in(commandements, "all") or (_is_in(commandements, "shield") and card_type == "Immunotherapie") or (_is_in(commandements, "precoce") and card_type == "Chirurgie") or (_is_in(commandements, "mutateStar") and card_type == "TherapieCiblee") or (_is_in(commandements, "timed") and card_type == "Radiotherapie")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func toggle_overlay():
	$AnalysisOverlay.toggle_visibility()
