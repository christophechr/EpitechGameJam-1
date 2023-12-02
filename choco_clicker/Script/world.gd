extends Node2D

var choco_nbr = 0
var sprite_texture = preload("res://Assets/choco.png")
var small_size = Vector2(0.1,0.1)
var nb_rouleau = 0
var nb_baker = 0
var nb_bakery = 0
var level_click = 10
var mult_up = 1
var menu1

@onready var roll_nb = $TextureRect1/roll_nb
@onready var bakery_cost = $TextureRect1/bakery_cost
@onready var bakery_nb = $TextureRect1/bakery_nb
@onready var baker_cost = $TextureRect1/baker_cost
@onready var baker_nb = $TextureRect1/baker_nb
@onready var roll_cost = $TextureRect1/roll_cost

signal nb_choco

# Called when the node enters the scene tree for the first time.
func _ready():
	menu1 = $TextureRect1
	menu1.visible = false

func _process(delta):
	emit_signal("nb_choco", choco_nbr)

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


func _on_right_pressed():
	menu1.visible = false

func _on_center_pressed():
	menu1.visible = false

func _on_left_pressed():
	menu1.visible = true


func _on_button_button_up():
	if choco_nbr > 50 * nb_rouleau:
		choco_nbr -= 50 * nb_rouleau
		nb_rouleau += 1
		roll_nb.text = str(nb_rouleau)
		roll_cost.text = str(50 * nb_rouleau)

func _on_button_2_button_up():
	if choco_nbr > 250 * nb_baker:
		choco_nbr -= 250 * nb_baker
		nb_baker += 1
		baker_nb.text = str(nb_baker)
		baker_cost.text = str(250 * nb_baker)

func _on_button_3_button_up():
	if choco_nbr > 1000 * nb_bakery:
		choco_nbr -= 1000 * nb_bakery
		nb_bakery += 1
		bakery_nb.text = str(nb_bakery)
		bakery_cost.text = str(1000 * nb_bakery)
