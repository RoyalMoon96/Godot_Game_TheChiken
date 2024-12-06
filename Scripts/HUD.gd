extends CanvasLayer


var player


func _ready():
	$Heart1.frame=1
	$Heart2.frame=1
	$Heart3.frame=1
	player = get_tree().get_root().find_child("Player",1,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_Harts()
	handle_Eggs()
	

func handle_Eggs():
	$Num_Eggs.text = ": "+str(player.Eggs)
	
func handle_Harts():
	if player.Lifes == 2:
		$Heart1.frame=3
	
	if player.Lifes == 1:
		$Heart2.frame=3
	
	if player.Lifes == 0:
		$Heart3.frame=3


func _on_button_pressed():
	GlobalVar.Eggs=get_tree().get_root().find_child('Player',1,0).Eggs
	get_tree().change_scene_to_file("res://Scenes/END.tscn")
