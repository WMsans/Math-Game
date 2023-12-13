function scr_overworld_chara_skill_spr(_pos){
	switch(global.charaskill[_pos][global.charanowskill]){
		case 1://Alex: 冲刺
			sprite_index=spr_player_ball;
			
			break;
		case 2:
			sprite_index=spr_player_battle_slash;
			
			break;
	}
}