if(instance_exists(obj_player)){
	if(scr_actual_dist(obj_player, self, 24)&&!global.skill_setting){
		//tarscale=1.2;
		if(global.expecting_textblock_x==-999||global.expecting_textblock_y==-999){
			global.expecting_textblock_x=x+(variable_instance_exists(id, "middle_block") ? 0 : sprite_width/2);
			global.expecting_textblock_y=y-(variable_instance_exists(id, "middle_block") ? sprite_height/2 : 0);
			if(!instance_exists(obj_textblock_arrow) && global.talking==0 && touch_r==0){
				
				with(instance_create_layer(x+sprite_width/2,y,"textbox",obj_textblock_arrow)){
					image_xscale=0;
					image_yscale=0;
				}
			}
		}
		if(keyboard_check_pressed(global.keyz)){
			if(!global.talking && !touch_r && global.expecting_textblock_x==x+(variable_instance_exists(id, "middle_block") ? 0 : sprite_width/2) && global.expecting_textblock_y==y-(variable_instance_exists(id, "middle_block") ? sprite_height/2 : 0)&&!obj_item_mainbox.showing){
				scr_create_chatbox(sign_id);
			}
			touch_r=1;
		}
	}else{
		tarxscale=1;
		taryscale=1;
		touch_r=0;
		arrow_r=0;
		if(global.expecting_textblock_x==x+(variable_instance_exists(id, "middle_block") ? 0 : sprite_width/2)&&global.expecting_textblock_y==y-(variable_instance_exists(id, "middle_block") ? sprite_height/2 : 0)){
			global.expecting_textblock_x=-999;
			global.expecting_textblock_y=-999;
		}
	}
}else{
	tarxscale=1;
	taryscale=1;
	touch_r=0;
	arrow_r=0;
}

image_xscale+=(tarxscale-image_xscale)/3;
image_yscale+=(taryscale-image_yscale)/3;
