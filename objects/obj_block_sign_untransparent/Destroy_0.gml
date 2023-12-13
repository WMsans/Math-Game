/// @description reset expecting_textblock
if(global.expecting_textblock_x==x+(variable_instance_exists(id, "middle_block") ? 0 : sprite_width/2) && global.expecting_textblock_y==y-(variable_instance_exists(id, "middle_block") ? sprite_height/2 : 0)){
	global.expecting_textblock_x=-999;
	global.expecting_textblock_y=-999;
}