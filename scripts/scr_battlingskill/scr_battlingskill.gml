/// @description 技能
function scr_battlingskill(_pos){
	switch(global.charaskill[_pos][global.charanowskill]){
		case 1://Alex: 冲刺
			var _k=0;
			var _wall_flag=0;
			if(skill_tarx==-999&&skill_tary==-999){//计算目标位置
				if(hsp==0){
					if(vsp==0){
						_k=0;
					}else{
						_k=99999;
					}
				}else{
					_k=vsp/hsp;
					
				}
					
				skill_tarx=sign(hsp)*sqrt(200*200 / (1 + _k*_k))+x;
				if(hsp!=0) skill_tary=_k*(skill_tarx-x)+y;
				else skill_tary=sign(vsp)*100+y;
			}
			if(abs(x-skill_tarx)>=5||abs(y-skill_tary)>=5){
				
				
				var _hsp=(skill_tarx-x)/4;
				if(place_meeting(x+_hsp,y,obj_block)||place_meeting(x+_hsp,y,obj_block_untransparent)){
					_wall_flag=1;
					var _blockid=instance_place(x+_hsp,y,obj_block);
					if(_blockid==noone) _blockid=instance_place(x+_hsp,y,obj_block_untransparent);
					var single=sign(_blockid.x-x);
					while(place_meeting(x-single,y,obj_block)||place_meeting(x-single,y,obj_block_untransparent)){
						x+=single;
					}
					_hsp=0;
				}
				x+=_hsp;//move the character hon
				
				var _vsp=(skill_tary-y)/4;
				if(place_meeting(x,y+_vsp,obj_block)||place_meeting(x,y+_vsp,obj_block_untransparent)){
					_wall_flag=1;
					var _blockid=instance_place(x,y+_vsp,obj_block);
					if(_blockid==noone) _blockid=instance_place(x,y+_vsp,obj_block_untransparent);
					var single=sign(y-_blockid.y);
					while(place_meeting(x,y-single,obj_block)||place_meeting(x,y-single,obj_block_untransparent)){
						y+=single;
					}
					_vsp=0;
				}
				y+=_vsp;//move the character vir
				if(_wall_flag){
					skill_tarx=-999;
					skill_tary=-999;
					chara_state=MOVING_STATE.idle;
					sprite_index=_chara_spr[MOVING_STATE.idle];
				}
			}else{//到了, 结束
				skill_tarx=-999;
				skill_tary=-999;
				chara_state=MOVING_STATE.idle;
				sprite_index=_chara_spr[MOVING_STATE.idle];
			}
			
			break;
		case 2://aleX 十字划
			chara_state=MOVING_STATE.idle;
			sprite_index=_chara_spr[MOVING_STATE.idle];
			break;
	}
}