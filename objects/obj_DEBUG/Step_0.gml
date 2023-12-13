scr_anim_step();

if(keyboard_check_pressed(vk_f2)) game_restart();

if(room!=rm_remapping){
/*	if(keyboard_check_pressed(global.keyesc)){
		if(!instance_exists(obj_setting)) instance_create_layer(-999,-999,"setting",obj_setting);
		else instance_destroy(obj_setting);
	}*/
	if(keyboard_check_pressed(global.keya)&&global.fighting==0){
		if(!instance_exists(obj_skillchange)) instance_create_layer(camera_get_view_x(view_camera[0])+160,camera_get_view_y(view_camera[0])+192,"itembox",obj_skillchange);
	
	}
}

if(keyboard_check_pressed(vk_f4)){//全屏切换
	if(file_exists("setting.sav")){
		ini_open("setting.sav");
		var nowstate=ini_read_real("graphic","Window Mode",1);
		scr_fullscreen(!nowstate);
		ini_write_real("graphic","Window Mode",!nowstate);
		ini_close();
	}else{
		scr_fullscreen(window_get_fullscreen());
	}
}

