extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Button_Play.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $VBoxContainer/Button_Play.has_focus():
		$Chicken.position.y=287

	if $VBoxContainer/Button_Quit.has_focus():
		$Chicken.position.y=315

func _on_button_play_pressed():

	get_tree().change_scene_to_file("res://Scenes/level_0.tscn")


func _on_button_quit_pressed():
	get_tree().quit()


func _on_button_focus_entered():
	$Select.pitch_scale = 5
	$Select.play()
