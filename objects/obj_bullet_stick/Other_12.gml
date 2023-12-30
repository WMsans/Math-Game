/// @description 
if !create 
{
	_body = instance_create_depth(x,y,depth,obj_bullet_stick_body)	
	_top = instance_create_depth(x+lengthdir_x(length/2,image_angle+90),y+lengthdir_y(length/2,image_angle+90),depth,obj_bullet_stick_top)	
	_bottom = instance_create_depth(x+lengthdir_x(length/2,image_angle+90+180),y+lengthdir_y(length/2,image_angle+90+180),depth,obj_bullet_stick_bottom)
	_top.mask = mask
	_body.mask = mask
	_bottom.mask = mask
	create = true
}
else
{
	image_angle += angle_speed
	length += length_speed
	x += x_speed
	y += y_speed
	_body.image_yscale = length/2
	_body.image_angle = image_angle
	_body.x = x
	_body.y = y
	_top.x = x+lengthdir_x(_body.sprite_height/2,image_angle+90)
	_top.y = y+lengthdir_y(_body.sprite_height/2,image_angle+90)
	_top.image_angle = image_angle
	_bottom.x = x+lengthdir_x(_body.sprite_height/2,image_angle+90+180)
	_bottom.y = y+lengthdir_y(_body.sprite_height/2,image_angle+90+180)
	_bottom.image_angle = image_angle
	_body.depth = depth
	_top.depth = depth
	_bottom.depth = depth
}