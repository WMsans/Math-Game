function scr_battlingspr(_pos){
	_chara_spr[0]=noone;
	switch(global.charaspr[_pos]){
		case 1://Alex
			_chara_spr[MOVING_STATE.intro]=spr_player_battle_intro;
			_chara_spr[MOVING_STATE.idle]=spr_player_battle;
			_chara_spr[MOVING_STATE.running]=spr_player_battle_run;
			_chara_spr[MOVING_STATE.slash]=spr_player_battle_slash;
			_chara_spr[MOVING_STATE.slashHB]=spr_player_battle_slashHB;
			sprite_index=_chara_spr[MOVING_STATE.idle];
			break;
		case 2://Natasha
			_chara_spr[MOVING_STATE.intro]=spr_natasha_battle_intro;
			_chara_spr[MOVING_STATE.idle]=spr_natasha_battle;
			_chara_spr[MOVING_STATE.running]=spr_natasha_battle_run;
			_chara_spr[MOVING_STATE.slash]=spr_natasha_battle_slash;
			_chara_spr[MOVING_STATE.slashHB]=spr_natasha_battle_slashHB;
			sprite_index=_chara_spr[MOVING_STATE.idle];
			break;
	}
}