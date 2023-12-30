/// @description 
if !create 
{
	_body = instance_create_depth(x,y,depth,obj_bullet_stick_body)	
	_top = instance_create_depth(x,y,depth,obj_bullet_stick_top)	
	_bottom = instance_create_depth(x,y,depth,obj_bullet_stick_bottom)
	create = true
}
else
{
	image_angle += angle_speed
	length += length_speed
	x += x_speed
	y += y_speed
	if instance_exists(_body)
	{
	_body.image_yscale = length/2
	_body.image_angle = image_angle
	_body.x = x+lengthdir_x(_body.sprite_height/2,image_angle+90)
	_body.y = y+lengthdir_y(_body.sprite_height/2,image_angle+90)
	_body.depth = depth
	}
	if instance_exists(_body)
	{
	_top.x = x+lengthdir_x(_body.sprite_height,image_angle+90)
	_top.y = y+lengthdir_y(_body.sprite_height,image_angle+90)
	_top.image_angle = image_angle
	_top.depth = depth
	}
	if instance_exists(_body)
	{
	_bottom.x = x+lengthdir_x(0,image_angle+90+180)
	_bottom.y = y+lengthdir_y(0,image_angle+90+180)
	_bottom.image_angle = image_angle
	_bottom.depth = depth
	}
	
	
	
}