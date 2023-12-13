function scr_battle_chara_skill_spr(_pos){
	switch(global.charaskill[_pos][global.charanowskill]){
		case 1://Alex: 冲刺
			sprite_index=spr_player_ball;
			
			break;
		case 2://Alex: 十字划
			sprite_index=spr_player_battle_slash;
			
			
			break;
	}
}