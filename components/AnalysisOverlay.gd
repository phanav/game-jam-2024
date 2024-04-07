extends CanvasGroup

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func display_commandements(commandements):
	for commandement in commandements:
		$Label.text += commandement
				# print($Label.visible)
		if commandement == "shield" or commandement ==  "all": 
			$ImmuneSprite.visible = true
		if commandement == "precoce" or commandement ==  "all":
			$PrecoceSprite.visible = true
		if commandement == "mutateStar" or commandement ==  "all":
			$MutatedSprite.visible = true
		if commandement ==	"timed" or commandement ==  "all":
			$LongdevSprite.visible = true

func toggle_visibility():
	visible = true
	$DisplayTimer.start()
	await $DisplayTimer.timeout
	visible = false
