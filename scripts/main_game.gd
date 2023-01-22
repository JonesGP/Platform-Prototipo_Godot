extends Node

var life = 2
var stars = 0
func _ready():
	pass


func _on_Area2D_area_entered(area):
	if area.name == "star":
		area.get_parent().queue_free()
		show_star()
	if area.name == "damage":
		life -= 1
		if life == 0:
			get_tree().change_scene("res://scenes/main_menu.tscn")
	elif area.name == "kill":
		area.get_parent().queue_free()
		$player.jump1()


func show_star():
	stars += 1
	if stars == 1:
		$star_status/star1.show()
	elif stars == 2:
		$star_status/star2.show()
	elif stars == 3:
		$star_status/star3.show()
		get_tree().change_scene("res://scenes/estagio2.tscn")
