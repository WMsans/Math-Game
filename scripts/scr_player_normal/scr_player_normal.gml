function scr_player_normal(){
	#region moving
	dirh=key_right-key_left;
	dirv=key_down-key_up;
	if(dirh!=0&&dirv==0) facing=dirh*2;
	else if(dirv!=0&&dirh==0) facing=0-dirv;

	if(dirh!=0) last_dirh=dirh;
	if(dirv!=0) last_dirv=dirv;

	hsp+=accel*dirh;
	vsp+=accel*dirv;
	//stop chara from hor
	if(dirh==0){
		if(hsp>0){
			hsp=max(0,hsp+decel);
		}
		if(hsp<0){
			hsp=min(0,hsp-decel);
		}
	}
	//stop chara from vir
	if(dirv==0){
		if(vsp>0){
			vsp=max(0,vsp+decel);
		}
		if(vsp<0){
			vsp=min(0,vsp-decel);
		}
	}

	hsp=clamp(hsp,-max_sp,max_sp);
	vsp=clamp(vsp,-max_sp,max_sp);
	//check the block
	if(place_meeting(x+hsp,y,obj_block)||place_meeting(x+hsp,y,obj_block_untransparent)){
		var single=sign(hsp);
		while(!place_meeting(x+single,y,obj_block)&&!place_meeting(x+single,y,obj_block_untransparent)) x+=single;
		hsp=0;
	}
	x+=hsp;//move the character hon
	if(place_meeting(x,y+vsp,obj_block)||place_meeting(x,y+vsp,obj_block_untransparent)){
		var single=sign(vsp);
		while(!place_meeting(x,y+single,obj_block)&&!place_meeting(x,y+single,obj_block_untransparent)) y+=single;
		vsp=0;
	}
	y+=vsp-z_move;//move the character vir
	#endregion
	#region sprite animation
	image_speed=1;
	if(hsp==0&&vsp==0){//player stay still
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
	
	}else{//player is moving
		switch(facing){
			case -1:
				image_xscale=1;
				sprite_index=sprwalk;
				break;
			case 1:
				image_xscale=1;
				sprite_index=sprbackwalk;
				break;
			case 2:
				image_xscale=-1;
				sprite_index=sprsidewalk;
				break;
			case -2:
				image_xscale=1;
				sprite_index=sprsidewalk;
				break;
		}
	}
	#endregion
	#region skill
	if(global.charaskillnum[global.charanowleader]){
		if(keyboard_check_pressed(global.keyx)&&!skill_cool_timer&&global.charaskillnum[global.charanowleader]){
			player_overworld_state=PLAYER_OVERWORLD_STATE.normalskill;
			scr_overworld_chara_skill_spr(global.charanowleader);
			skill_cool_timer=skill_cool;
		}else if(skill_cool_timer){
			skill_cool_timer--;
		}
	}
	#endregion
	
}