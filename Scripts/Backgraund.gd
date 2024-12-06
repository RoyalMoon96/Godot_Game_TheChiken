extends Node2D

func _process(delta):
	set_position(get_tree().get_root().find_children("Player","",1,0)[0].position)

	#print((get_tree().get_root().find_children("Player","",1,0)[0].find_children("Camera2D","",1,0)[0].position)

