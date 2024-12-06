extends CharacterBody2D


const SPEED = 25
const JUMP_VELOCITY = -400.0
var moving_left=true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")+50

var onFloor= false

func _physics_process(delta):
	#if $RayCast2DV.enabled():
	velocity.y += gravity*delta
	move_character()
	turn()


func move_character():
	$AnimationPlayer.play("Move")


	if moving_left:
		velocity.x = -SPEED
		#velocity.y = -100
	else:
		velocity.x = SPEED
		#velocity.y = -100

	move_and_slide()

	
func _on_area_2d_body_entered(body):
	if body.get_name() == 'Player':
		body.loseLife()

func turn ():
	if (not $RayCast2DV.is_colliding() or ($RayCast2DH.is_colliding() and $RayCast2DH.get_collider() != get_tree().get_root().find_child('Player',1,0))) and is_on_floor():
		moving_left= !moving_left
		scale.x= -scale.x
