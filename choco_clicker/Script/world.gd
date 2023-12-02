extends Node2D

var choco_nbr = 0
var sprite_texture = preload("res://Assets/choco.png")
var small_size = Vector2(0.1,0.1)
var nb_rouleau = 0
var nb_baker = 0
var nb_bakery = 0
var level_click = 1
var mult_up = 1
var menu1
var menu2

@onready var roll_nb = $TextureRect1/roll_nb
@onready var bakery_cost = $TextureRect1/bakery_cost
@onready var bakery_nb = $TextureRect1/bakery_nb
@onready var baker_cost = $TextureRect1/baker_cost
@onready var baker_nb = $TextureRect1/baker_nb
@onready var roll_cost = $TextureRect1/roll_cost
@onready var click_nb = $TextureRect2/click_nb
@onready var house_cost = $TextureRect2/house_cost
@onready var house_nb = $TextureRect2/house_nb
@onready var click_cost = $TextureRect2/click_cost

signal nb_choco

# Called when the node enters the scene tree for the first time.
func _ready():
	menu1 = $TextureRect1
	menu2 = $TextureRect2
	menu2.visible = false
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
	menu2.visible = true

func _on_center_pressed():
	menu1.visible = false
	menu2.visible = false

func _on_left_pressed():
	menu1.visible = true
	menu2.visible = false

func _on_button_button_up():
	if choco_nbr > 50 * (nb_rouleau + 1):
		choco_nbr -= 50 * (nb_rouleau + 1)
		nb_rouleau += 1
		roll_nb.text = str(nb_rouleau)
		roll_cost.text = str(50 * nb_rouleau)

func _on_button_2_button_up():
	if choco_nbr >= 250 * (nb_baker + 1):
		choco_nbr -= 250 * (nb_baker + 1)
		nb_baker += 1
		baker_nb.text = str(nb_baker)
		baker_cost.text = str(250 * nb_baker)

func _on_button_3_button_up():
	if choco_nbr >= 1000 * (nb_bakery + 1):
		choco_nbr -= 1000 * (nb_bakery + 1)
		nb_bakery += 1
		bakery_nb.text = str(nb_bakery)
		bakery_cost.text = str(1000 * nb_bakery)


func _on_button_4_button_up():
	if choco_nbr >= 25 * level_click:
		choco_nbr -= round(25 * level_click)
		level_click *= 1.5
		level_click = round(level_click)
		click_nb.text = str(level_click)
		click_cost.text = str(round(25 * level_click))

func _on_button_5_button_up():
	if choco_nbr >= 10000 * mult_up:
		choco_nbr -= 10000 * mult_up
		mult_up += 1
		house_nb.text = str(mult_up)
		house_cost.text = str(10000 * mult_up)
