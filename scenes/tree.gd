extends StaticBody2D

func _ready():
	$Tree.texture = load('res://assets/tree' + str(randi_range(1,3)) + '.png')
