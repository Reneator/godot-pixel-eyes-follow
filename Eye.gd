extends Node2D


#export (NodePath) var follow_entity

export (Texture) var top_left
export (Texture) var top_right
export (Texture) var bot_left
export (Texture) var bot_right

export (NodePath) var target_path
var target

export (NodePath) var eye_master_path # the eye will sync up with the eye mentioned here, as to prevent cross-eyedness (heart thats unhealthy)
var eye_master


enum STATES {TOP_LEFT, TOP_RIGHT, BOT_LEFT, BOT_RIGHT}
var state

func _ready():
	if eye_master_path:
		eye_master = get_node(eye_master_path)
		return
	
	if target_path:
		target = get_node(target_path)

func _process(delta):
	if eye_master:
		var master_state = eye_master.state
		set_state(master_state)
		return
	
	var follow_position
	if target:
		if target is Node2D:
			follow_position = target.global_position
		elif target is Control:
			follow_position = target.rect_global_position
	else:
		follow_position = get_global_mouse_position()
	
	var radians = get_angle_to(follow_position)
	var angle = rad2deg(radians)
	
	if 90 > angle and angle > 0:
		set_state(STATES.BOT_RIGHT)
	if 180 > angle and angle > 90:
		set_state(STATES.BOT_LEFT)
	if -180 < angle and angle < -90:
		set_state(STATES.TOP_LEFT)
	if -90 < angle and angle < 0:
		set_state(STATES.TOP_RIGHT)

func set_state(_state):
	state = _state
	match state:
		STATES.BOT_RIGHT: $Sprite.texture = bot_right
		STATES.BOT_LEFT: $Sprite.texture = bot_left
		STATES.TOP_RIGHT: $Sprite.texture = top_right
		STATES.TOP_LEFT: $Sprite.texture = top_left
