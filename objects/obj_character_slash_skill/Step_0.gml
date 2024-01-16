/// @description 
scr_skill_slash_detect();
if(instance_exists(obj_player)){
	x = obj_player.x;
	y = obj_player.y;
	var _vsp = obj_player.vsp;
	var _hsp = obj_player.hsp;
	if(!scr_actual_equal(_hsp, 0, 1) || !scr_actual_equal(_vsp, 0, 1)){
		image_angle = point_direction(0,0,_hsp,_vsp);
	}
	depth = obj_player.depth - 1;
}else instance_destroy();

if(scr_animation_end()){
	instance_destroy();
}else if(scr_animation_end_half()){
	ds_list_clear(hitbyattack);
}

