extends Sprite2D
signal click

var normal_size = Vector2(1, 1)
var smaller_size = Vector2(0.9, 0.9)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_choco_button_up():
	scale = normal_size
	emit_signal("click")

func _on_choco_button_down():
	scale = smaller_size
