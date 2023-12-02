extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("BML"):
		print("main_click_zone")


func _on_boulangère_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("BML"):
		print("Boulangère")
