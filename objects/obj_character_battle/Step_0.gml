if(!initflag){//initialize
	initflag=true;//no more init in the next step
	scr_battlingspr(pos);
	mask_index=sprite_index;
	scr_battlingskill_init(pos);
}
if(guiwei){
	sprite_index=_chara_spr[MOVING_STATE.idle];
	image_xscale=1;
	x+=(144-x)/5;
	y+=(init_chara_y[pos]-y)/5;
	if(abs(x-144)<3&&abs(y-init_chara_y[pos])<3) guiwei=false;
}
if(obj_battle.battle_state==BATTLE_STATES.enemy){//战斗中
	if(obj_battle.battle_chara_now==pos){
		#region key check
		if(chara_state!=MOVING_STATE.slash&&chara_state!=MOVING_STATE.skill){
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
		y+=vsp;//move the character vir
		obj_battle_arrow.tarx=x;
		obj_battle_arrow.tary=y;
		#endregion
		#region attack
		if(!instance_exists(obj_battle.battle_ui_dialog)){
			if(keyboard_check_pressed(global.keyz)&&chara_state==MOVING_STATE.idle){
				chara_state=MOVING_STATE.slash;
				sprite_index=_chara_spr[MOVING_STATE.slash];
				image_index=0;
				ds_list_clear(hitbyattack);
			}
			if(chara_state==MOVING_STATE.slash){
				scr_battle_chara_slash_detect();
				if(scr_animation_end()||scr_animation_end_half()){//image_index%(image_number/2)<1
					ds_list_clear(hitbyattack);
					if(!keyboard_check(global.keyz)){
						chara_state=MOVING_STATE.idle;
						sprite_index=_chara_spr[MOVING_STATE.idle];
					}
				}
			}
		}
		#endregion
		#region skill
		if(keyboard_check_pressed(global.keyx)&&global.charaskillnum[pos]!=0){
			chara_state=MOVING_STATE.skill;
			scr_battle_chara_skill_spr(pos);
		}
		if(chara_state==MOVING_STATE.skill){
			scr_battlingskill(pos);
		}
		#endregion
		#region animation
		if(chara_state!=MOVING_STATE.slash&&chara_state!=MOVING_STATE.runslash&&chara_state!=MOVING_STATE.skill){
			if(hsp==0&&vsp==0){
				chara_state=MOVING_STATE.idle;
				sprite_index=_chara_spr[MOVING_STATE.idle];
			}else{//player is moving
				chara_state=MOVING_STATE.running;
				sprite_index=_chara_spr[MOVING_STATE.running];
			}
		}
		//探测敌人位置
		var _flag=true;
		var _closdis=999;
		var _closobj=noone;
		for(var i=0;i<scr_enemy_num();i++){
			if(_closdis>distance_to_object(scr_enemy_get(i))){
				_closdis=distance_to_object(scr_enemy_get(i));
				_closobj=scr_enemy_get(i);
			}
		}
		if(_closdis<200){
			_flag=false;
			image_xscale=sign(_closobj.x-x);
		}
		if(_flag&&dirh!=0) image_xscale=dirh;
	
		#endregion
	}else{
		if(!guiwei) x+=(-80-x)/5;
	}
}else{
	if(sprite_index==_chara_spr[MOVING_STATE.slash]){
		if(image_index==image_number/2){
			chara_state=MOVING_STATE.idle;
			sprite_index=_chara_spr[MOVING_STATE.idle];
		}
	}
}
if(inv>0){
	inv--;
}
if(flashalpha>0){
	flashalpha-=0.05;
}
