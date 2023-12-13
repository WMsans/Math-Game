/// @description 
if(instance_exists(obj_player)){
	if(distance_to_object(obj_player)<24&&!obj_item_mainbox.showing){
		//tarscale=1.2;
		if(global.expecting_textblock_x==-999||global.expecting_textblock_y==-999){
			global.expecting_textblock_x=x;
			global.expecting_textblock_y=y-sprite_height/2;
			if(!instance_exists(obj_textblock_arrow) && global.talking==0 && touch_r==0){
				with(instance_create_layer(x,y-sprite_height/2,"textbox",obj_textblock_arrow)){
					image_xscale=0;
					image_yscale=0;
				}
			}
		}
		if(keyboard_check_pressed(global.keyz)){
			if(!global.talking && !touch_r && global.expecting_textblock_x==x && global.expecting_textblock_y==y-sprite_height/2){
				scr_create_chatbox(sign_id);
				//change spr
				state=scr_obj_direction(id,obj_player)+3;
				if(spr[state]!=sprite_index){
					if(state==STATE.right_talk) tarxscale=swap_side ? -1 : 1;
					image_xscale=0;
				}
			}
			touch_r=1;
		}
	}else{
		tarxscale=1;
		taryscale=1;
		touch_r=0;
		arrow_r=0;
		if(global.expecting_textblock_x==x&&global.expecting_textblock_y==y-sprite_height/2){
			global.expecting_textblock_x=-999;
			global.expecting_textblock_y=-999;
		}
		if(!global.talking){
			state=default_state;
			if(spr[state]!=sprite_index){
				if(state==STATE.right_talk) tarxscale=swap_side ? -1 : 1;
				image_xscale=0;
			}
		}
	}
}else{
	tarxscale=1;
	taryscale=1;
	touch_r=0;
	arrow_r=0;
}
sprite_index=spr[state];
image_xscale+=(tarxscale-image_xscale)/3;
image_yscale+=(taryscale-image_yscale)/3;
