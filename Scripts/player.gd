extends CharacterBody2D



var SPEED = 100
const JUMP_VELOCITY = -300.0
@export var Lifes =3
var Eggs

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")+50

var ducking = 1 # 1 = false  0.02 = true (para disminuir su velocidad en x)

func _ready():
	Eggs=GlobalVar.Eggs

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("sprint"):
		$AnimationPlayer.speed_scale=2
		SPEED = 200

	if Input.is_action_just_released("sprint"):
		$AnimationPlayer.speed_scale=1
		SPEED = 100


	# Handle Jump.
	if Input.is_action_just_pressed("ui_up") and (is_on_floor() or not $Timer_jump.is_stopped()):
		if ducking==1:
			$AnimationPlayer.play("walk")
		velocity.y = JUMP_VELOCITY
		$Jump.pitch_scale = 1
		$Jump.play()#
		
	if Input.is_action_just_pressed("ui_down"):
		print("duck")
		ducking=0.02
		$AnimationPlayer.play("duck")
		$Jump.pitch_scale = 5
		$Jump.play()
		
	if Input.is_action_just_released("ui_down"):
		ducking=1
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if ducking==1:
			$AnimationPlayer.play("walk")
		if direction<0:
			$Sprite2D.flip_h=0 
		elif direction>0:
			$Sprite2D.flip_h=1
			
		#if not ducking:
		velocity.x = direction * SPEED * ducking
	else:
		#if  ducking:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity==Vector2(0.0,0.0) and ducking==1:
			$AnimationPlayer.play("idle")
			
			
	var was_on_floor = is_on_floor()
	move_and_slide()
	if was_on_floor !=  is_on_floor():
		$Timer_jump.start()

func loseLife():
	Lifes -=1
	if Lifes < 1:
		get_tree().reload_current_scene()
	print("lifes left = "+ str(Lifes))
	position = get_tree().get_root().find_child('Spawn',1,0).get_position()
	
func add_Egg():
	Eggs +=1
	
	print("Eggs: "+str(Eggs))

func _on_water_body_entered(body):
	if body.get_name() == 'Player':
		loseLife()

func _on_area_2d_body_entered(body):
	if body.get_name() == 'Player':
		loseLife()
		


func _on_finish_line_body_entered(body):
	if body.get_name() == 'Player':
		GlobalVar.Eggs=Eggs

		if get_tree().current_scene.name != 'level_2':
			get_tree().change_scene_to_file("res://Scenes/level_"+str(get_tree().current_scene.name.to_int()+1)+".tscn")
		else :
			get_tree().change_scene_to_file("res://Scenes/END.tscn")


func _on_spike_body_entered(body):
	if body.get_name() == 'Player':
		loseLife()


func _on_spike_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	pass # Replace with function body.

