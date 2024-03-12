extends RigidBody2D

export var speed=400
var screen_size

func _ready():
#	hide()
	screen_size=get_viewport_rect().size

func start(pos):
	position=pos
	show()
	$CollisionShape2D.disabled=false

func _process(delta):
	var vel=Vector2();
	
	if Input.is_action_pressed("ui_up"):
		vel.y=-1
	elif Input.is_action_pressed("ui_down"):
		vel.y=1
	
	if vel.length()>0:
		vel=vel.normalized()*speed
		position+=vel*delta
		position.x=clamp(position.x,0,screen_size.x)
		position.y=clamp(position.y,0,screen_size.y)

#func _on_Tuks_body_entered(body):
#	print("collision")
#	hide()
#	$CollisionShape2D.set_deferred("disabled",true)
#	emit_signal("hit")

func _on_Tuks_body_entered(body):
	print("entered")

func _on_Tuks_body_exited(body):
	print("exited")

func _on_Tuks_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("shape entered")

func _on_Tuks_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	print("shape exited")
