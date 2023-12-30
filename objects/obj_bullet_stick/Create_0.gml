/// @description 
event_inherited();
length = 30
angle_speed = 0
length_speed = 0
x_speed = 0
y_speed = 0
timer = -1
destroy_time = -infinity
type = 2
_top = -1
_body = -1
_bottom = -1
hitbox = 1
create = false
event_user(type+2)
function x_y()
{
	x = argument[0]
	y = argument[1]
}
function x_y_angle()
{
	x = argument[0]
	y = argument[1]
	image_angle = argument[2]
}
function x_y_length()
{
	x = argument[0]
	y = argument[1]
	length = argument[2]
}
function x_y_length_angle()
{
	x = argument[0]
	y = argument[1]
	length = argument[2]
	image_angle = argument[3]
}