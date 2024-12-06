extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Button_Continue.grab_focus()
	$Num_Eggs.text = str(GlobalVar.Eggs)+'/95'

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_button_continue_pressed():
	$Select.pitch_scale = 5
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


