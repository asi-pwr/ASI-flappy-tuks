extends CanvasLayer

var you_died=false
var score=0
var delta_timer = 0
export (float) var score_update_interval
export (float) var score_multiplier

func _ready():
	$DiedText.hide()

func died():
	you_died=true
	$DiedText.show()

func _process(delta):
	if not you_died:
		score+=delta*score_multiplier
	delta_timer += delta
	if (delta_timer > score_update_interval):
		delta_timer = 0
		$Scores.text="Score: " + str(int(score))
