/// @arg x
/// @arg y
/// @arg length
/// @arg angle
/// @arg type*
/// @arg x_speed*
/// @arg y_speed*
/// @arg angle_speed*
/// @arg length_speed*
/// @arg color*
/// @arg destroy_time*
/// @arg alpha*
function Stick()
{
	var _x = argument[0]
	var _y = argument[1]
	var length = argument[2]
	var angle = argument[3]
	var type = 0,v_speed = 0,h_speed = 0,angle_speed = 0,length_speed = 0,destroy_time = -infinity,alpha = 1,color = 0,_depth = "player"
	if argument_count > 4 var type = argument[4]
	if argument_count > 6 var v_speed = argument[6]
	if argument_count > 5 var h_speed = argument[5]
	if argument_count > 7 var angle_speed = argument[7]
	if argument_count > 8 var length_speed = argument[8]
	if argument_count > 9 var color = argument[9]
	if argument_count > 10 var destroy_time = argument[11]
	if argument_count > 11 var alpha = argument[12]
	_depth = "player"
	var bone = instance_create_layer(_x,_y,_depth,obj_bullet_stick)
	bone.type = type
	bone.image_angle = angle
	bone.length = length
	bone.x_speed = h_speed
	bone.y_speed = v_speed
	bone.angle_speed = angle_speed
	bone.length_speed = length_speed
	bone.destroy_time = destroy_time
	bone.alpha = alpha
	return bone
}