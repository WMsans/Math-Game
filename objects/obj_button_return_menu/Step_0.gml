if(room==rm_remapping){
	if(obj_remapping_arrow.select==999){
		hover=1;
		if (keyboard_check_pressed(global.keyz)){
			if(global.detecting_input) global.detecting_input=false;
			scr_fadeout(global.target_rm,global.target_x,global.target_y);
		}
	}else hover=0;
} else hover=0;

