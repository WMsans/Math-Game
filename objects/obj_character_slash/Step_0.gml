/// @description 
scr_battle_chara_slash_detect();
if(instance_exists(obj_character_battle)){
	x = obj_character_battle.x;
	y = obj_character_battle.y;
	var _flag = obj_character_battle._flag;
	var _closobj = obj_character_battle._closobj;
	if(_flag){
		var _vsp = obj_character_battle.vsp;
		var _hsp = obj_character_battle.hsp;
		if(!scr_actual_equal(_hsp, 0, 1) || !scr_actual_equal(_vsp, 0, 1)){
			image_angle = point_direction(0,0,_hsp,_vsp);
		}
	}else{
		if(instance_exists(_closobj))
			image_angle = point_direction(x,y,_closobj.x,_closobj.y);
	}
	
}else instance_destroy();
if(!instance_exists(obj_wave)) instance_destroy();
else if(instance_exists(obj_wave_ending)) instance_destroy();

if(scr_animation_end()||scr_animation_end_half()){//image_index%(image_number/2)<1
	ds_list_clear(hitbyattack);
	if(!keyboard_check(global.keyz)){
		instance_destroy();
	}
	
}
