extends Node

class Worker:
	var name = ""
	var level = 0
	var chocolatine_nbr = 0
	var current_creation_progress = 0
	
	func set_chocolatine_nbr(value: int):
		chocolatine_nbr = value
		if chocolatine_nbr > (WORKER_PILE_SIZE + level * 5):
			chocolatine_nbr = WORKER_PILE_SIZE + level * 5
	
	func update(delta):
		var created_chocolatines = 0

		current_creation_progress += delta * level + 1
		created_chocolatines = current_creation_progress / TIME_TO_CREATE
		current_creation_progress %= TIME_TO_CREATE
		set_chocolatine_nbr(chocolatine_nbr + created_chocolatines)

@export var workers = []
@export var money = 0
@export var workbench_level = 0

const TIME_TO_CREATE = 10
const WORKER_PILE_SIZE = 10

func _process(delta):
	for worker in workers:
		worker.update(delta)
