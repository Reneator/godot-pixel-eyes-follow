extends Node2D


#export (NodePath) var follow_entity

export (Texture) var top_left
export (Texture) var top_right
export (Texture) var bot_left
export (Texture) var bot_right

var target



func _process(delta):
	
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
		$Sprite.texture = bot_right
	if 180 > angle and angle > 90:
		$Sprite.texture = bot_left
	if -180 < angle and angle < -90:
		$Sprite.texture = top_left
	if -90 < angle and angle < 0:
		$Sprite.texture = top_right
