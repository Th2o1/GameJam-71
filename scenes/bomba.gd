extends Node2D

@onready var animationExplosion = $AnimationPlayer
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var event
	left_click_check(event)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func left_click_check(event):
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		print("Wow, a left mouse click")
		
	
