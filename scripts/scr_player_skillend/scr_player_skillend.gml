function scr_player_skillend(){
	switch(global.charaskill[global.charanowleader][global.charanowskill]){
		case 1://Alex: 冲刺
			skill_tarx=-999;
			skill_tary=-999;
			player_overworld_state=PLAYER_OVERWORLD_STATE.normal;
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
					case 2:
						image_xscale=-1;
						sprite_index=sprside;
						break;
					case -2:
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
			break;
		case 2://Alex: 十字划
			skill_init=1;
			player_overworld_state=PLAYER_OVERWORLD_STATE.normal;
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
					case 2:
						image_xscale=-1;
						sprite_index=sprside;
						break;
					case -2:
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
			break;
	}
}