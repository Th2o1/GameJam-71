extends Node


#games variables
const total_mines : int=40
var time_remaining : float
var remaining_mines : int

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	
func new_game():
	time_remaining = 120
	remaining_mines = total_mines
	$GameOver.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_remaining -= delta
	$Hud.get_node("timeLabel").text = str(int(time_remaining))
	$Hud.get_node("remainingBomb").text = str(remaining_mines)
