function scr_battlingspr(_pos){
	_chara_spr[0]=noone;
	switch(global.charaspr[_pos]){
		case 1://Alex
			_chara_spr[MOVING_STATE.intro] = spr_king;
			_chara_spr[MOVING_STATE.idle] = spr_king;
			_chara_spr[MOVING_STATE.running] = spr_king_walk;
			_chara_spr[MOVING_STATE.slash]= spr_sword_slash;
			_chara_spr[MOVING_STATE.runslash] = spr_sword_slash;
			_chara_spr[MOVING_STATE.slashHB] = spr_sword_slashHB;
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