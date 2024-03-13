extends RigidBody2D

export var speed=4000
export var maxSpeed=4000;

var screen_size
var game_over=false

func _ready():
#	hide()
	screen_size=get_viewport_rect().size
	set_contact_monitor(true)

func start(pos):
	position=pos
	show()
	$CollisionShape2D.disabled=false

func _process(delta):
	if(game_over):
		return;
	
	var vel=Vector2();
	
	if Input.is_action_pressed("ui_up"):
		vel.y=-1
	elif Input.is_action_pressed("ui_down"):
		vel.y=1
	if Input.is_action_pressed("ui_left"):
		vel.x=-1
	elif Input.is_action_pressed("ui_right"):
		vel.x=1
	
	linear_velocity+=vel*delta*speed;
	linear_velocity.x*lerp(linear_velocity.y,0,friction)
	var currentSpeed=linear_velocity.length()
	if currentSpeed>maxSpeed:
		linear_velocity=linear_velocity.normalized()*maxSpeed

func	 _physics_process(delta):
	linear_velocity.x += -linear_velocity.x*0.05
	linear_velocity.y += -linear_velocity.y*0.05

#func _on_Tuks_body_entered(body):
#	print("collision")
#	hide()
#	$CollisionShape2D.set_deferred("disabled",true)
#	emit_signal("hit")

func _on_RigidBody2D_body_entered(body):
	hide()
	$CollisionShape2D.set_deferred("disabled",true)
	game_over=true
