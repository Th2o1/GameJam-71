extends TileMap

#grid variables
const rows : int=14
const cols : int=15
const cell_size : int=50


#tilemap variables
var tile_id : int=2


#layer variables
var mine_layer : int=0
var numbers_layer : int=1
var grass_layer : int=2
var flags_layer : int=3
var hover_layer : int=4


#atlas coordinates
var mine_atlas := Vector2i(4, 0)

#liste pour stocker les coords des mines
var mine_coords := []



# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	

func new_game():
	clear()
	mine_coords.clear()
	generate_mines()
	generate_numbers()

func generate_mines():
	for i in range(get_parent().total_mines):
		var mine_pos = Vector2i(randi_range(0, cols - 1), randi_range(0, rows - 1))
		while mine_coords.has(mine_pos):
			mine_pos = Vector2i(randi_range(0, cols - 1), randi_range(0, rows - 1))
		mine_coords.append(mine_pos)
		#add mine to tilemap
		set_cell(mine_layer, mine_pos, tile_id, mine_atlas)

func generate_numbers():
	#get empty cells
	#iterate through empty cells and get all surround cells

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
