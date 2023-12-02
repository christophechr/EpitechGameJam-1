extends Node2D

var choco_nbr = 0
var sprite_texture = preload("res://Assets/choco.png")
var small_size = Vector2(0.1,0.1)
var nb_rouleau = 1
var nb_baker = 0
var nb_bakery = 0
var level_click = 5
var mult_up = 1

signal nb_choco

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	emit_signal("nb_choco", choco_nbr)


func _on_left_button_up():
	pass # Replace with function body.


func _on_center_button_up():
	pass # Replace with function body.


func _on_right_button_up():
	pass # Replace with function body.

func _on_sprite_2d_click():
	choco_nbr += 1 * level_click
	var sprite = RigidBody2D.new()
	sprite.position = Vector2(randi() % 541,0)
	add_child(sprite)
	var sprite_t = Sprite2D.new()
	sprite_t.texture = sprite_texture
	sprite_t.scale = small_size
	sprite.add_child(sprite_t)


func _on_timer_timeout():
	choco_nbr += nb_rouleau * mult_up
	choco_nbr += nb_baker * 10 * mult_up
	choco_nbr += nb_bakery * 100 * mult_up
