#region key check
if(!instance_exists(obj_fade) && !instance_exists(obj_chatbox) && !(instance_exists(obj_item_mainbox)&&obj_item_mainbox.showing) &&!instance_exists(obj_savebox) &&!global.setting &&!instance_exists(obj_cutscene) &&!global.skill_setting){
	key_left=keyboard_check(global.keyleft);
	key_right=keyboard_check(global.keyright);
	key_down=keyboard_check(global.keydown);
	key_up=keyboard_check(global.keyup);
}else{
	key_left=0;
	key_right=0;
	key_down=0;
	key_up=0;
}
#endregion

if(!instance_exists(obj_cutscene)) script_execute(state_machine[player_overworld_state]);
else{//spr归位
	if(player_overworld_state==PLAYER_OVERWORLD_STATE.normal||player_overworld_state==PLAYER_OVERWORLD_STATE.normalskill){
		//sprite return to normal
		switch(facing){
			case -1:
				image_xscale=1;
				sprite_index=spr;
				break;
			case 1:
				image_xscale=1;
				sprite_index=sprback;
				break;
			case 2://右
				image_xscale=-1;
				sprite_index=sprside;
				break;
			case -2://左
				image_xscale=1;
				sprite_index=sprside;
				break;
		}
	}
}
#region character following
if(hsp!=0||vsp!=0){//player moved, update the state
	for(var i=array_size-1;i>0;i--){
		follower_x[i]=follower_x[i-1];
		follower_y[i]=follower_y[i-1];
		follower_face[i]=follower_face[i-1];
	}
	follower_x[0]=x;
	follower_y[0]=y;
	follower_face[0]=facing;
}
#endregion
if(inv>0){
	inv--;
}
if(flashalpha>0){
	flashalpha-=0.05;
}
