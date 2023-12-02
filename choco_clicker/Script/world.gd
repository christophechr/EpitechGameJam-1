extends Node2D

var click = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_left_button_up():
	pass # Replace with function body.


func _on_center_button_up():
	pass # Replace with function body.


func _on_right_button_up():
	pass # Replace with function body.


func _on_sprite_2d_click():
	click += 1
	print(click)
