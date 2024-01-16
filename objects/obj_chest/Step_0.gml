/// @description 
event_inherited();

if(global.expecting_textblock_x==x+(variable_instance_exists(id, "middle_block") ? 0 : sprite_width/2)&&global.expecting_textblock_y==y-(variable_instance_exists(id, "middle_block") ? sprite_height/2 : 0)&&global.talking){
	image_index = 1;
}else{
	image_index = 0;
}